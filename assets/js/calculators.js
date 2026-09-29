const OPERATORS = {
  "+": { precedence: 1, associativity: "left", apply: (a, b) => a + b },
  "-": { precedence: 1, associativity: "left", apply: (a, b) => a - b },
  "*": { precedence: 2, associativity: "left", apply: (a, b) => a * b },
  "/": { precedence: 2, associativity: "left", apply: (a, b) => a / b },
  "^": { precedence: 3, associativity: "right", apply: (a, b) => a ** b }
};

function splitList(value) {
  return (value || "")
    .split(",")
    .map((item) => item.trim())
    .filter(Boolean);
}

function parseInputs(value) {
  return splitList(value).map((item) => {
    const [name, placeholder = ""] = item.split(":").map((part) => part.trim());
    return { name, placeholder };
  });
}

function parseConstants(value) {
  const constants = {};

  splitList(value).forEach((item) => {
    const [name, rawValue] = item.split("=").map((part) => part.trim());
    const number = Number(rawValue);

    if (name && Number.isFinite(number)) {
      constants[name] = number;
    }
  });

  return constants;
}

function tokenize(expression) {
  const tokens = [];
  let index = 0;
  let previousType = "operator";

  while (index < expression.length) {
    const char = expression[index];

    if (/\s/.test(char)) {
      index += 1;
      continue;
    }

    const isUnaryMinus = char === "-" && (previousType === "operator" || previousType === "(");
    const isSignedNumber = isUnaryMinus && /[0-9.]/.test(expression[index + 1] || "");

    if (/[0-9.]/.test(char) || isSignedNumber) {
      const match = expression.slice(index).match(/^-?\d*\.?\d+(?:e[+-]?\d+)?/i);

      if (!match) {
        throw new Error("Invalid number.");
      }

      tokens.push({ type: "number", value: Number(match[0]) });
      index += match[0].length;
      previousType = "number";
      continue;
    }

    if (/[A-Za-z_]/.test(char)) {
      const match = expression.slice(index).match(/^[A-Za-z_][A-Za-z0-9_]*/);
      tokens.push({ type: "identifier", value: match[0] });
      index += match[0].length;
      previousType = "identifier";
      continue;
    }

    if (char === "(" || char === ")") {
      tokens.push({ type: char });
      index += 1;
      previousType = char;
      continue;
    }

    if (Object.hasOwn(OPERATORS, char)) {
      if (isUnaryMinus) {
        tokens.push({ type: "number", value: 0 });
      }

      tokens.push({ type: "operator", value: char });
      index += 1;
      previousType = "operator";
      continue;
    }

    throw new Error(`Unsupported character: ${char}`);
  }

  return tokens;
}

function toRpn(tokens) {
  const output = [];
  const operators = [];

  tokens.forEach((token) => {
    if (token.type === "number" || token.type === "identifier") {
      output.push(token);
      return;
    }

    if (token.type === "operator") {
      const current = OPERATORS[token.value];

      while (operators.length > 0) {
        const top = operators[operators.length - 1];

        if (top.type !== "operator") {
          break;
        }

        const previous = OPERATORS[top.value];
        const shouldPop =
          previous.precedence > current.precedence ||
          (previous.precedence === current.precedence &&
            current.associativity === "left");

        if (!shouldPop) {
          break;
        }

        output.push(operators.pop());
      }

      operators.push(token);
      return;
    }

    if (token.type === "(") {
      operators.push(token);
      return;
    }

    if (token.type === ")") {
      while (operators.length > 0 && operators[operators.length - 1].type !== "(") {
        output.push(operators.pop());
      }

      if (operators.length === 0) {
        throw new Error("Mismatched parentheses.");
      }

      operators.pop();
    }
  });

  while (operators.length > 0) {
    const token = operators.pop();

    if (token.type === "(" || token.type === ")") {
      throw new Error("Mismatched parentheses.");
    }

    output.push(token);
  }

  return output;
}

function evaluateRpn(tokens, values) {
  const stack = [];

  tokens.forEach((token) => {
    if (token.type === "number") {
      stack.push(token.value);
      return;
    }

    if (token.type === "identifier") {
      if (!Object.hasOwn(values, token.value)) {
        throw new Error(`Missing value: ${token.value}`);
      }

      stack.push(values[token.value]);
      return;
    }

    if (token.type === "operator") {
      if (stack.length < 2) {
        throw new Error("Invalid expression.");
      }

      const right = stack.pop();
      const left = stack.pop();
      stack.push(OPERATORS[token.value].apply(left, right));
    }
  });

  if (stack.length !== 1 || !Number.isFinite(stack[0])) {
    throw new Error("Could not calculate a finite result.");
  }

  return stack[0];
}

function evaluateExpression(expression, values) {
  return evaluateRpn(toRpn(tokenize(expression)), values);
}

function createCalculator(container) {
  const expression = container.dataset.expression;
  const inputsConfig = parseInputs(container.dataset.inputs);
  const constants = parseConstants(container.dataset.constants);
  const resultLabel = container.dataset.result || "Result";
  const resultUnit = container.dataset.unit || "";

  if (!expression || inputsConfig.length === 0) {
    return;
  }

  const form = document.createElement("form");
  form.className = "calculator";

  const grid = document.createElement("div");
  grid.className = "calculator-grid";

  const inputs = {};

  inputsConfig.forEach((inputConfig) => {
    const label = document.createElement("label");
    label.textContent = inputConfig.name;

    const input = document.createElement("input");
    input.type = "text";
    input.placeholder = inputConfig.placeholder;

    label.appendChild(input);
    grid.appendChild(label);
    inputs[inputConfig.name] = input;
  });

  const button = document.createElement("button");
  button.type = "submit";
  button.textContent = container.dataset.button || "Calculate";

  const message = document.createElement("p");
  message.className = "calculator-message";
  message.setAttribute("role", "status");

  form.appendChild(grid);
  form.appendChild(button);
  form.appendChild(message);

  form.addEventListener("submit", (event) => {
    event.preventDefault();

    const values = { ...constants };

    for (const inputConfig of inputsConfig) {
      const text = inputs[inputConfig.name].value.trim();
      const value = Number(text);

      if (text === "" || !Number.isFinite(value)) {
        message.textContent = "Please enter valid numbers.";
        return;
      }

      values[inputConfig.name] = value;
    }

    try {
      const result = evaluateExpression(expression, values);
      const unitText = resultUnit ? ` ${resultUnit}` : "";
      message.textContent = `${resultLabel} = ${result}${unitText}`;
    } catch (error) {
      message.textContent = error.message;
    }
  });

  container.replaceWith(form);
}

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-calculator]").forEach(createCalculator);
});
