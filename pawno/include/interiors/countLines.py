from os import listdir
from os import getcwd


count = 0
for file in listdir(getcwd()):
    with open(file, mode='r', encoding='utf-8') as f:
        count += len(f.readlines())
print(count)
