from pathlib import Path
import shutil

def organize_md_files(base_dir: str):
    base_path = Path(base_dir)

    if not base_path.exists():
        raise FileNotFoundError(f"資料夾不存在：{base_dir}")

    for md_file in base_path.glob("*.md"):
        # 原始檔名（不含副檔名）
        original_stem = md_file.stem

        # 將空格換成底線
        new_stem = original_stem.replace(" ", "_")
        new_filename = new_stem + ".md"
        new_md_path = base_path / new_filename

        # 若需要重新命名
        if md_file.name != new_filename:
            if new_md_path.exists():
                print(f"⚠️ 檔案已存在，略過重新命名：{new_filename}")
            else:
                md_file.rename(new_md_path)
                md_file = new_md_path  # 更新指標

        # 建立同名資料夾
        target_dir = base_path / new_stem
        target_dir.mkdir(exist_ok=True)

        # 移動檔案到資料夾中
        target_md_path = target_dir / new_filename
        if not target_md_path.exists():
            shutil.move(str(md_file), str(target_md_path))
        else:
            print(f"⚠️ 目標已存在，略過移動：{target_md_path}")

if __name__ == "__main__":
    organize_md_files("Under_preparation")
    print("✅ 完成檔案整理！")
