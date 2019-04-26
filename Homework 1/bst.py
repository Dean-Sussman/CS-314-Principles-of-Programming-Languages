class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

def insert(root, node):
    if root.value == node.value:
        return
    elif root is None:
        root = node
    else:
        if root.value < node.value:
            if root.right is None:
                root.right = node
            else:
                insert(root.right, node)
        else:
            if root.left is None:
                root.left = node
            else:
                insert(root.left, node)

def search(root, value, seq):
    if root is None:
        print("not found")
        return root
    elif root.value == value:
        print(f"found: {' ' .join(seq)}")
        return root
    elif root.value < value:
        seq.append("r")
        return search(root.right, value, seq)
    else:
        seq.append("l")
        return search(root.left, value, seq)

def printTree(root):
    if root:
        printTree(root.left)
        print(f"{root.value}")
        printTree(root.right)



rt = None


try:
    while True:
        sequence = []
        userIn = input().split()
        if rt is None:
            if userIn[0] == "i":
                newNode = Node(int(userIn[1]))
                rt = newNode
            else:
                print("not found")
        elif userIn[0] == "i":
            newNode = Node(int(userIn[1]))
            insert(rt, newNode)
        elif userIn[0] == "q":
            if rt.value == int(userIn[1]):
                print("found: root")
            else:
                search(rt, int(userIn[1]), sequence)

except EOFError:
    exit()
