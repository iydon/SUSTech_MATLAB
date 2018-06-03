from sys import argv
from math import floor
from numpy import matrix, reshape



def crypto(x):
    p = 97
    x = matrix([ord(i) for i in x])
    x[x==169] = 127
    x[x==174] = 128

    x = (x-32) % p

    n = 2*floor(x.size/2)
    X = reshape(x[0,0:n], [2,int(n/2)])

    A = matrix([[71,2],[2,26]])
    Y = A*X % p

    y = reshape(Y, [1,n])

    if x.size > n:
        y = y.tolist()[0]
        y.append((p-1)*x[0,n] % p)
        y = matrix(y)

    y += 32
    y[y==127] = 169
    y[y==128] = 174
    y = y.tolist()[0]

    str = ''
    for num in y:
        str += chr(num)
    return str



print(crypto(argv[1]))