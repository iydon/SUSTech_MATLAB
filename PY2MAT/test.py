#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time   : 2018/10/15 14:30
# @Author : Iydon
# @File   : test.py
# `matlab -nodesktop' -> `from matlab import *'


from matlab import *


f = lambda n: fft(eye(n))
plot(real(f(17)), imag(f(17)))
legend()
axis("equal")
show()
