const OPERATORS = {
  "+": { precedence: 1, associativity: "left", apply: (a, b) => a + b },
  "-": { precedence: 1, associativity: "left", apply: (a, b) => a - b },
  "*": { precedence: 2, associativity: "left", apply: (a, b) => a * b },
  "/": { precedence: 2, associativity: "left", apply: (a, b) => a / b },
  "^": { precedence: 3, associativity: "right", apply: (a, b) => a ** b }
};

// Trigonometric arguments and inverse-trigonometric results use radians.
const FUNCTIONS = {
  sin: Math.sin,
  cos: Math.cos,
  tan: Math.tan,
  arcsin: Math.asin,
  arccos: Math.acos,
  arctan: Math.atan,
  asin: Math.asin,
  acos: Math.acos,
  atan: Math.atan,
  ln: Math.log
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
  while (index < expression.length) {
    const char = expression[index];
    if (/\s/.test(char)) { index++; continue; }
    if (/[0-9.]/.test(char)) {
      const match = expression.slice(index).match(/^(?:\d+(?:\.\d*)?|\.\d+)(?:e[+-]?\d+)?/i);
      if (!match || !Number.isFinite(Number(match[0]))) throw new Error("Invalid number.");
      tokens.push({ type: "number", value: Number(match[0]) });
      index += match[0].length;
      continue;
    }
    if (/[A-Za-z_]/.test(char)) {
      const name = expression.slice(index).match(/^[A-Za-z_][A-Za-z0-9_]*/)[0];
      index += name.length;
      const isFunction = expression.slice(index).trimStart().startsWith("(");
      tokens.push({ type: isFunction ? "function" : "identifier", value: name });
      continue;
    }
    if (char === "(" || char === ")") {
      tokens.push({ type: char });
    } else if (Object.hasOwn(OPERATORS, char)) {
      tokens.push({ type: "operator", value: char });
    } else {
      throw new Error(`Unsupported character: ${char}`);
    }
    index++;
  }
  return tokens;
}

function toRpn(tokens) {
  const output = [];
  let index = 0;
  const isOperator = (...names) => tokens[index]?.type === "operator" && names.includes(tokens[index].value);
  function closeParenthesis() {
    if (tokens[index]?.type !== ")") throw new Error("Mismatched parentheses.");
    index++;
  }
  function primary() {
    const token = tokens[index++];
    if (!token) throw new Error("Invalid expression.");
    if (token.type === "number" || token.type === "identifier") {
      output.push(token);
    } else if (token.type === "(") {
      sum();
      closeParenthesis();
    } else if (token.type === "function") {
      if (!Object.hasOwn(FUNCTIONS, token.value)) throw new Error(`Unsupported function: ${token.value}`);
      if (tokens[index++]?.type !== "(") throw new Error("Expected function parentheses.");
      sum();
      closeParenthesis();
      output.push(token);
    } else {
      throw new Error("Invalid expression.");
    }
  }
  function power() {
    primary();
    if (isOperator("^")) {
      const operator = tokens[index++];
      // A signed exponent is allowed, and powers associate to the right.
      unary();
      output.push(operator);
    }
  }
  function unary() {
    if (isOperator("+", "-")) {
      const sign = tokens[index++].value;
      unary();
      output.push({ type: "unary", value: sign });
    } else {
      // Exponentiation binds tighter than a leading sign: -2^2 = -(2^2).
      power();
    }
  }
  function product() {
    unary();
    while (isOperator("*", "/")) {
      const operator = tokens[index++];
      unary();
      output.push(operator);
    }
  }
  function sum() {
    product();
    while (isOperator("+", "-")) {
      const operator = tokens[index++];
      product();
      output.push(operator);
    }
  }
  sum();
  if (index !== tokens.length) throw new Error("Invalid expression. Use explicit multiplication and balanced parentheses.");
  return output;
}

function evaluateRpn(tokens, values) {
  const stack = [];
  function push(value) {
    if (!Number.isFinite(value)) throw new Error("Could not calculate a finite result.");
    stack.push(value);
  }
  for (const token of tokens) {
    if (token.type === "number") {
      push(token.value);
    } else if (token.type === "identifier") {
      if (!Object.hasOwn(values, token.value)) throw new Error(`Missing value: ${token.value}`);
      push(values[token.value]);
    } else if (token.type === "operator") {
      if (stack.length < 2) throw new Error("Invalid expression.");
      const right = stack.pop();
      const left = stack.pop();
      push(OPERATORS[token.value].apply(left, right));
    } else if (token.type === "unary" || token.type === "function") {
      if (stack.length < 1) throw new Error("Invalid expression.");
      const value = stack.pop();
      if (token.type === "unary") {
        push(token.value === "-" ? -value : value);
      } else {
        if (!Object.hasOwn(FUNCTIONS, token.value)) throw new Error(`Unsupported function: ${token.value}`);
        push(FUNCTIONS[token.value](value));
      }
    }
  }
  if (stack.length !== 1) throw new Error("Invalid expression.");
  return stack[0];
}

function evaluateExpression(expression, values) {
  return evaluateRpn(toRpn(tokenize(expression)), values);
}

function createCalculator(container) {
  if (container.dataset.pending) {
    const notice = document.createElement("p");
    notice.className = "calculator calculator-pending";
    notice.textContent = "Calculator pending: " + container.dataset.pending;
    container.replaceWith(notice);
    return;
  }
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
  form.setAttribute("aria-label", `Calculate ${resultLabel}`);
  const title = document.createElement("p");
  title.className = "calculator-title";
  title.textContent = `Calculate ${resultLabel}`;
  form.appendChild(title);
  if (container.dataset.note) {
    const note = document.createElement("p");
    note.className = "calculator-note";
    note.textContent = container.dataset.note;
    form.appendChild(note);
  }

  const grid = document.createElement("div");
  grid.className = "calculator-grid";

  const inputs = {};

  inputsConfig.forEach((inputConfig) => {
    const label = document.createElement("label");
    label.textContent = inputConfig.name + (inputConfig.placeholder ? ` — ${inputConfig.placeholder}` : "");

    const input = document.createElement("input");
    input.type = "text";
    input.inputMode = "decimal";
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
      message.textContent = `${resultLabel} = ${Number(result.toPrecision(10))}${unitText}`;
    } catch (error) {
      message.textContent = error.message;
    }
  });

  container.replaceWith(form);
}

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-calculator]").forEach(createCalculator);
});
