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


class matlab(object):
	'''
	MATLAB functions.
	'''
	def __init__(self):
		'''
		Initialize.
		'''
		self.__pyout   = print
		self.__symbols = []

	def tic(self):
		'''
		tic() -> tic
		'''
		self.TIC_START_TIME = time.time()

	def toc(self):
		'''
		toc() -> toc
		'''
		try:
			return time.time() - self.TIC_START_TIME
		except AttributeError as e:
			self.__pyout(self.__error('You must call TIC without an output argument before calling TOC without an input argument.'))

	def __parseMatrix2List(self, matrixStr='[]'):
		'''
		Parse MATLAB matrix string to Python List.

		Example:
		    '[1 .2 -3;.4 +5,6;-7 -.8 9e-1] [1 -2 .3 +.4,5]'
		'''
		matrixStr = re.sub('[ ]+', ' ', matrixStr)
		matrixStr = re.sub('((?<=\[) +)|( +(?=\]))|((?<=[^\d\.]) +)|( +(?=[^\d\-\.+]))','',matrixStr)
		result = []
		for lst in re.findall('(?<=\[)[\s\S]+?(?=\])',matrixStr):
			try:
				matrix = [[float(row) for row in re.split('[, ]+', row)] for row in re.split(';', lst)]
				result.append(matrix[0] if len(matrix)==1 else matrix)
			except ValueError as e:
				self.__pyout(self.__error('Dimensions of arrays being concatenated are not consistent.'))
		return result

	def __success(self, string='Success!'):
		'''
		Success output.
		'''
		return self.__color(string=string, fore='绿')

	def __error(self, string='Error!'):
		'''
		Error output.
		'''
		return self.__color(string=string)

	def __warning(self, string='Warning!'):
		'''
		Warning output.
		'''
		return self.__color(string=string, fore='黄')

	def __color(self, string='I', fore='红', back='黑', disp='默认'):
		'''
		Coloring text.

		Args:
			string: String, text to be colored.
			fore: String, foreground color.
			back: String, background color.
			disp: String, display effect.

		Returns:
			Text with color information.
		'''
		colormap = {'黑':['30','40'],
					'红':['31','41'],
					'绿':['32','42'],
					'黄':['33','43'],
					'蓝':['34','44'],
					'紫':['35','45'],
					'青':['36','46'],
					'白':['37','47'],}
		disp_map = {'默认':'0',
					'高亮':'1',
					'下划':'4',
					'闪烁':'5',
					'反白':'7',
					'隐藏':'8',}
		return '\033[%s;%s;%sm%s\033[0m'% \
					(disp_map[disp], colormap[fore][0], \
					 colormap[back][-1], string)

m = matlab()
