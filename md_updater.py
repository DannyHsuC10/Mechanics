# md_updater.py
# data ======================================
mass = 2.0  # kg
acceleration = 9.8  # m/s²
force = mass * acceleration  # F = ma

# Markdown ======================================
md_content = f"""
# force calculation

$$F = ma = {force:.2f}$$

result:

- mass: {mass} kg
- acceleration: {acceleration} m/s²
- force: {force:.2f} N
"""


# write md file ======================================
with open("experiment.md", "w", encoding="utf-8") as f:
    f.write(md_content)

print("file created.")
