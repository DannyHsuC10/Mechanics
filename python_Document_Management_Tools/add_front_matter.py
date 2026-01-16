# add_front_matter
from pathlib import Path

FRONT_MATTER = """---
layout: base
---

"""

def add_front_matter(base_dir: str):
    base_path = Path(base_dir)

    if not base_path.exists():
        raise FileNotFoundError(f"資料夾不存在：{base_dir}")

    for md_file in base_path.rglob("*.md"):
        content = md_file.read_text(encoding="utf-8")

        # 去除前導空白後判斷是否已有 front matter
        stripped = content.lstrip()

        if stripped.startswith("---"):
            print(f"✓ 已有 front matter，略過：{md_file}")
            continue

        # 插入 front matter
        new_content = FRONT_MATTER + content
        md_file.write_text(new_content, encoding="utf-8")
        print(f"+ 已加入 front matter：{md_file}")

if __name__ == "__main__":
    add_front_matter("Under_preparation")
    print("處理完成！")