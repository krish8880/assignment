import maneger 
import c

def option():
    print("\n")
    print("***wellcome to krish store***")
    print("1.maneger")
    print("2.customer")

while True:
    option()

    role =int(input("enter your role:"))
    print("\n")
    if role == 1:
        print("**[wellcome maneger]**")
        print("1.update stock")
        print("2.view stock")
        print("3.add fruit")
      
        choice =int(input("enter the choice:"))
        if choice == 1:
            maneger.update()
        elif choice == 2:
            maneger.view()
        elif choice == 3:
            maneger.add()
        else:
            print("enter choice from 1 to 3")
    else:
        c.customer()
