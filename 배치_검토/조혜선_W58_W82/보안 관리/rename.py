
import os

file_path = './'
file_names = os.listdir(file_path)

print(file_names)

for name in file_names:
    if name.find('.bat') != -1:
        src = os.path.join(file_path, name)
        dst = '' + name.replace('[', '').replace(']', '')
        dst = os.path.join(file_path, dst)
        os.rename(src, dst)