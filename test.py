def func1():
    x = 5
    def func2():
        #nonlocal x
        x+=1
        print(x)
        
    func2()


func1()