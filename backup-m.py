import asyncio
import shutil
import zipfile
from telegram import Bot
from telegram import InputFile
import os
from datetime import datetime

async def backup_and_zip(source_folders, backup_folder):
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    backup_folder_name = f"{backup_folder}_{timestamp}"

    # Membuat folder backup jika belum ada
    os.makedirs(backup_folder_name, exist_ok=True)

    # Menyalin isi setiap folder ke dalam folder backup
    for source_folder in source_folders:
        destination_folder = os.path.join(backup_folder_name, os.path.basename(source_folder))
        shutil.copytree(source_folder, destination_folder, dirs_exist_ok=True)

    zip_filename = f"{backup_folder_name}.zip"
    with zipfile.ZipFile(zip_filename, 'w', compression=zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(backup_folder_name):
            for file in files:
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, backup_folder_name)
                zipf.write(file_path, arcname=arcname)

    # Menghapus folder backup setelah dikompres
    shutil.rmtree(backup_folder_name)
    
    return zip_filename

async def main():
    telegram_bot_token = '6876357941:AAET3Rn72YWe7jbfLtX7ZkQRLV49LRz8rWc'
    telegram_chat_id = '1799509652'

    source_folders = ['/var/lib/marzban', '/opt/marzban']
    backup_folder_name = 'NAMA01'

    zip_file_path = await backup_and_zip(source_folders, backup_folder_name)

    bot = Bot(token=telegram_bot_token)
    await bot.send_document(chat_id=telegram_chat_id, document=InputFile(open(zip_file_path, 'rb')))

    os.remove(zip_file_path)

asyncio.run(main())
