def update():
    fruit = input("enter fruit name :")
    q2 = int(input("enter quentity:"))
    l2=[]
    try:
        f= open("stock.txt","r")
        l2=f.readlines()
        f.close()
    except:
        pass
    l2.append(f"{fruit}:{q2}\n")
    f =open("stock.txt","w")
    f.writelines(l2)
    f.close()
    print("fruit updated")



def view():
    try:

        f = open("stock.txt", "r")

        l1 = f.readlines()

        f.close()

        
        if not l1:
            print("no fruit")


        else:

            print("\n--- Fruit Stock ---")
            for l in l1:
                print(l)


    except:
        print("no stock file")


def add():
    fruit =input("enter fruit name:")
    q =int(input("enter qeantity:"))
    l=[]
    try:
        f= open("stock.txt","r")
        l=f.readlines()
        f.close()
    except:
        pass
    l.append(f"{fruit}:{q}\n")
    f =open("stock.txt","w")
    f.writelines(l)
    f.close()
    print("fruit added")


