def multiplication (n,A,B):#n = A*B(None)
    if A == None:
        A = n/B
        return(A)
        
    if B == None:
        B = n/A
        return(B)
        
    if n == None:
        n = A*B
        return(n)

def twe_times_integral(n,C,Bs):
    if C == None:
        C = 2*n/Bs
        return(C)
    
    if Bs == None:
        Bs = (2*n/C)**(1/2)
        return(Bs)
    
    if n ==None:
        n = C*(Bs**2)/2
        return(n)

def sum_of_squares (l,x,y,z):#n**2 = (A**2)/+(B**2)
    if x == None:
        x = ((l**2)-(y**2)-(z**2))**(1/2)
        return(x)
        
    if y == None:
        y = ((l**2)-(x**2)-(z**2))**(1/2)
        return(y)
        
    if z == None:
        z = ((l**2)-(y**2)-(x**2))**(1/2)
        return(z)
    
    if l == None:
        l = ((x**2)+(y**2)+(z**2))**(1/2)
        return(l)
    
    
    