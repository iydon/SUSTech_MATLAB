from re import split, findall, sub
import numpy as np

	
def mat2lst(content):
	# '[1,2;3,4]' -> [[1,2],[3,4]]
	# str         -> list
	return [[[float(row) for row in split('[, ]+',row)] for row in split(';',lst)] for lst in findall('(?<=\[)[\s\S]+?(?=\])', sub('((?<=[^\d\.]) +)|( +(?=[^\d\-+]))', '', sub(' +',' ',content)))]

lsts = matstr2pylst('[1,-2; +3. 4] [1. -2 ; 3. +4], [1, 2 ;3   +4] ! [1;2. ; 3 ;-4]. [-1 , 2 ;3.,4]')
print(lsts)



def op2mat(s):
	# 'T(x1,x2)=(x2,x1)' -> [[0,1],[1,0]]
	# str                -> list
	s     = s.replace(' ','')
	flg   = re.findall('^[a-zA-Z0-9]+(?=\()', s)[0]
	parts = re.findall('(?<=\()[\S]+?(?=\))', s)

	V = re.split(',', parts[0])
	W = re.split(',', parts[1])
	M = [[0]*len(W) for i in range(0, len(V))]

	for i in range(0, len(V)):
		for j in range(0, len(W)):
			if V[i] in W[j]:
				tmp = re.findall('[\+\-]?[\d\.e]+(?=\*%s)'%V[i], W[j])
				M[i][j] = float(tmp[0]) if tmp else float(1)
	
	return np.matrix(M)

res = 'T(a1,a2,a3,a4,a5,a6,a7)=(a2,a3,a4,a5,a6,a7,a1)'
print(res)
print(str2mat(res))