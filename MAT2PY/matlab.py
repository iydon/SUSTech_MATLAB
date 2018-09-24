#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time   : 2018/08/26 17:53
# @Author : Iydon
# @File   : matlab.py

# Basis
import time, re
# Numerical calculating
import numpy
# Symbolic calculation
import sympy
# Figures
import matplotlib


class matlab(object):
	"""
	MATLAB functions.
	"""
	def __init__(self):
		"""
		Initialize.
		"""
		self.__pyout   = print
		# CONSTANT
		self.inf   = float("inf")
		self.pi    = numpy.pi
		self.e     = numpy.e
		self.i     = complex(0, 1)
		self.j     = complex(0, 1)
		# FUNCTION
		self.sin   = numpy.sin
		self.cos   = numpy.cos
		self.tan   = numpy.tan
		self.asin  = numpy.arcsin
		self.acos  = numpy.arccos
		self.atan  = numpy.arctan
		self.sinh  = numpy.sinh
		self.cosh  = numpy.cosh
		self.tanh  = numpy.tanh
		self.asinh = numpy.arcsinh
		self.acosh = numpy.arccosh
		self.atanh = numpy.arctanh
		self.exp   = numpy.exp
		self.log   = numpy.log

	def tic(self):
		"""
		tic() -> tic
		"""
		self.TIC_START_TIME = time.time()

	def toc(self):
		"""
		toc() -> toc
		"""
		try:
			return time.time() - self.TIC_START_TIME
		except AttributeError as e:
			self.__pyout(self.__error("You must call TIC without an output argument before calling TOC without an input argument."))

	def rand(self, *size):
		"""
		rand - 均匀分布的随机数
		此 MATLAB 函数 返回一个在区间 (0,1) 内均匀分布的随机数。
		----------------------------
		X = rand()
		X = rand(n)
		X = rand(sz1,...,szN)
		X = rand(sz)
		"""
		if len(size)==1:
			if isinstance(size[0], int):
				return self.rand(size[0], size[0])
			elif isinstance(size[0], list):
				return numpy.random.random(size[0])
		else:
			return numpy.random.random(size)

	def det(self, Matrix):
		"""
		det - 矩阵行列式
		此 MATLAB 函数 返回方阵 A 的行列式。
		----------------------------
		d = det(A)
		"""
		return numpy.linalg.det(Matrix)

	def convert2list(self, string:str)->list:
		"""
		Convert MATLAB matrix string to List.
		"""
		tmp = self.__parseConstant2Value(string)
		return self.__parseMatrix2List(tmp)

	def __parseConstant2Value(self, matrixStr="[]"):
		"""
		Parse Constant(inf,pi,e,i) to value.
		"""
		replac = ["inf", "pi", "e", "i", "j"]
		return re.sub("(?<=[^\d])(?=%s)"%"|".join(replac), "self.", matrixStr)

	def __parseMatrix2List(self, matrixStr="[]"):
		"""
		Parse MATLAB matrix string to Python List.

		Example:
		    "[1 .2 -3;.4 +5,6;-7 -.8 9e-1] [1 -2 .3 +.4,5]"
		"""
		matrixStr = re.sub("[ ,]+", " ", matrixStr)
		result = []
		for lst in re.findall("(?<=\[)[\s\S]*?(?=\])",matrixStr):
			ele = ["[%s]"%i.replace(" ", ",") for i in lst.split(";")]
			matrix = eval("[%s]"%",".join(ele))
			result.append(matrix if len(matrix)>1 else matrix[0])
		return result

	def __success(self, string="Success!"):
		"""
		Success output.
		"""
		return self.__color(string=string, fore="绿")

	def __error(self, string="Error!"):
		"""
		Error output.
		"""
		return self.__color(string=string)

	def __warning(self, string="Warning!"):
		"""
		Warning output.
		"""
		return self.__color(string=string, fore="黄")

	def __color(self, string="I", fore="红", back="黑", disp="默认"):
		"""
		Coloring text.

		Args:
			string: String, text to be colored.
			fore: String, foreground color.
			back: String, background color.
			disp: String, display effect.

		Returns:
			Text with color information.
		"""
		colormap = {"黑":["30","40"],
					"红":["31","41"],
					"绿":["32","42"],
					"黄":["33","43"],
					"蓝":["34","44"],
					"紫":["35","45"],
					"青":["36","46"],
					"白":["37","47"],}
		disp_map = {"默认":"0",
					"高亮":"1",
					"下划":"4",
					"闪烁":"5",
					"反白":"7",
					"隐藏":"8",}
		return "\033[%s;%s;%sm%s\033[0m"% \
					(disp_map[disp], colormap[fore][0], \
					 colormap[back][-1], string)


# matlab -nodesktop
m = matlab()
test = m.convert2list("[1,2;3,4]")[0]
print(m.det(m.rand(3, 3)))