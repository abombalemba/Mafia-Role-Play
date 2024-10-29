with open('Government.pwn', mode='r', encoding='utf') as file:
    data = file.readlines()

with open('Government2.pwn', mode='w', encoding='utf') as file:
    for line in data:
        if 'CreateDynamicObject' in line:
            line = line.split(', ')
            Y = line[2]
            Z = line[3]
            line[2] = str(int(Y.split('.')[0]) - 2000) + '.' + Y.split('.')[1]
            line[3] = str(int(Z.split('.')[0]) - 500) + '.' + Z.split('.')[1]
            print(line)
            file.write(', '.join(line))
        else:
            file.write(line)
