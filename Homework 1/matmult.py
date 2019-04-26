#dimensions1 = input("Rows and columns in matrix 1: ").split()
dimensions1 = input().split()
#print(f"{dimensions1[0]} rows {dimensions1[1]} columns")

matrix1 = []

for i in range(int(dimensions1[0])):
    #row = input('Values for row {i}: ').split()
    row = input().split()
    if len(row) != int(dimensions1[1]):
    	print("invalid input")
    	exit()
    for i in range(len(row)):
        row[i] = float(row[i])
    matrix1.append(row)

#dimensions2 = input("Rows and columns in matrix 2: ").split()
dimensions2 = input().split()

if dimensions1[1] != dimensions2[0]:
    print("invalid input")
    exit()


matrix2 = []

for i in range(int(dimensions2[0])):
    #row = input("Values for row {i}: ").split()
    row = input().split()
    if len(row) != int(dimensions2[1]):
    	exit()
    for i in range(len(row)):
        row[i] = float(row[i])
    matrix2.append(row)

for row in matrix1:
    for elem in row:
        print(elem, end=' ')
    print()

for row in matrix2:
    for elem in row:
        print(elem, end=' ')
    print()

matrix3 = [[0.0] * len(matrix2[0]) for i in range(len(matrix1))]

for row in matrix3:
    for elem in row:
        print(elem, end=' ')
    print()

entry = 0.0

for i in range(len(matrix1)):
    for j in range(len(matrix2[0])):
        for k in range(len(matrix2)):
            entry += matrix1[i][k] * matrix2[k][j]
            matrix3[i][j] = entry
        entry = 0.0

for row in matrix3:
    for elem in row:
        print(elem, end = ' ')
    print()
