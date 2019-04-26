graph = {}

states = input().split()


#initialize 2d dictionary
for i in range(1, len(states)):
    graph[states[i]] = {}

symbols = input().split() #not sure what to do with these

userInput = input().split() #begin_rules
userInput = input().split() #rules line 1


while userInput[0] != 'end_rules':
    graph[userInput[0]][userInput[4]] = userInput[2]
    userInput = input().split()


userInput = input().split() #'node' the dfa will start at
startingState = userInput[1]

endingStates = input().split()
endingStates.pop(0)


try:
    rejected = False
    while True:
        sequence = input()
        if(graph.get(startingState).get(sequence[0], -1) == -1):
            print("rejected")
            continue
        else:
            nextState = graph[startingState][sequence[0]]
            if(len(sequence) > 1):
                for char in sequence:
                    if(graph.get(nextState).get(char, -1) == -1):
                        print("rejected")
                        rejected = True
                        break
                    else:
                        nextState = graph[nextState][char]
            if(rejected == False):
                try:
                    endingStates.index(nextState)
                    print("accepted")
                except ValueError:
                    print("rejected")
            else:
                rejected = False
            

except EOFError:
    exit()
