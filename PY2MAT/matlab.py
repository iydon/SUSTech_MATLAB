#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time   : 2018/10/12 17:00
# @Author : Iydon
# @File   : matlab.py
# `matlab -nodesktop' -> `from matlab import *'


# tic, toc, disp
import time
def tic(): globals()['TIC+TIME'] = time.time()
toc = lambda :time.time()-globals()['TIC+TIME']
disp = print
tic()



# numpy
import numpy
# function from numpy about operators
from numpy import sin, cos, tan, arcsin as asin, arccos as acos, arctan as atan, sinc
from numpy import sinh, cosh, tanh, arcsinh as asinh, arccosh as acosh, arctanh as atanh
from numpy import power, exp, log, log2, log10, log1p, sqrt
from numpy import real, imag
# function from numpy about value
from numpy import linspace, logspace
from numpy import rad2deg, deg2rad, sign, conj
from numpy import prod, cumprod, cumsum, sum, mean, std, min, max, var, cov, sort, mod
from numpy import round, floor, ceil, fix
from numpy import nansum, nanmax, nanmin, nanstd, nanvar
# function from numpy about random
from numpy.random import rand, randn, randint as randi, permutation as randperm
# function from numpy about fft
from numpy.fft import fft, fft2, fftn, fftshift, ifft, ifft2, ifftn, ifftshift
# function from numpy about logical
from numpy import all, any, isinf, isnan
from numpy import logical_and as and_, logical_not as not_, logical_or as or_, logical_xor as xor_
# function from numpy about polynomial
from numpy import poly, roots, polyint, polyder, polyval, polyfit
# function from numpy about matrix
from numpy import matrix, array
from numpy import size, rot90, flip, fliplr, flipud, reshape
from numpy import hstack as horzcat, vstack as vertcat, tile as repmat
from numpy import diag, zeros, ones, eye, char
# function from numpy about matrix calculation
from numpy.linalg import det, solve, inv, pinv, det, svd, eig, norm, qr, cond
from numpy.linalg import matrix_rank as rank, cholesky as chol
# constant from numpy or by numpy
from numpy import pi, inf, Inf, nan, NaN
i = j = numpy.complex(0, 1)
# auxiliary function from numpy
from numpy import who, lookfor, save
# attributes of array and matrix:
# array.T=>{array'}; array.flatten=>{array(:)}
# image function from numpy
from numpy import meshgrid



# scipy
import scipy
# function from numpy about matrix calculation
from scipy.linalg import lu, sqrtm



# matplotlib
import matplotlib
# plot 2D
from matplotlib.pyplot import plot, scatter, bar, barh, contourf, contour, pie, hist, spy, polar
from matplotlib.pyplot import imshow
# current figure
from matplotlib.pyplot import gca, gcf, figure, subplot
# axis ang text
from matplotlib.pyplot import axis, show, xlim, ylim, xticks, yticks, legend, grid
from matplotlib.pyplot import annotate as text, cm as colormap
# auxiliary param
from matplotlib.pyplot import savefig



# pyplot, mplot3d
from mpl_toolkits.mplot3d import Axes3D
"""
t   = linspace(-1, 1, 10)
X,Y = meshgrid(t, t)
Z   = sin(X*Y)
fig = figure()
axs = Axes3D(fig)
axs.plot_surface(X,Y,Z)
show()
"""



"""
# sympy
import sympy    # from sympy import *
# function from sympy about operators
from sympy import symbols as sym
from sympy import sin, cos, tan, asin, acos, atan, sinh, cosh, tanh, asinh, acosh, atanh
from sympy import exp, log
"""



disp("Elapsed time is %.6f seconds."%toc())
