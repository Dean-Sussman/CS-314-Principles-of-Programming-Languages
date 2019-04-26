operands = []
result = -1
try:
        while True:
                #userIn = input("Enter an operator or an operand: ")
                userIn = input()
                if userIn.isnumeric():
                        operands.append(float(userIn))
                        print(f"{operands[len(operands)-1]}")
                else:
                        if len(operands) == 0:
                                print("invalid operation")
                        elif len(operands) == 1 and userIn == "~":
                                result = -operands.pop()
                                operands.append(result)
                                print(f"{operands[len(operands)-1]}")
                        elif len(operands) < 2:
                                print("invalid operation")
                        elif userIn == "+":
                                temp = operands.pop()
                                result = operands.pop() + temp
                                operands.append(result)
                                print(f"{operands[len(operands)-1]}")
                        elif userIn == "-":
                                temp = operands.pop()
                                result = operands.pop() - temp
                                operands.append(result)
                                print(f"{operands[len(operands)-1]}")           
                        elif userIn == "*":
                                temp = operands.pop()
                                result = operands.pop() * temp
                                operands.append(result)
                                print(f"{operands[len(operands)-1]}")
                        elif userIn == "/":
                                temp = operands.pop()
                                if temp == 0:
                                        print("invalid operation")
                                        operands.append(temp)
                                else:
                                        result = operands.pop() / temp
                                        operands.append(result)
                                        print(f"{operands[len(operands)-1]}")
                        else:
                                print("invalid operation")
except EOFError:
        exit()
