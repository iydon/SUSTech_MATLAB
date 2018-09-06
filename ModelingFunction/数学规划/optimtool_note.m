%线性规划 linprog()
%二次规划 quadprog()

%一维优化问题MATLAB工具箱中的基本函数
x = fminbnd(fun, x1, x2);
%返回(x1, x2)中函数fun的极小值
x = fminbnd(fun, x1, x2, options);
%optiions:	Display(off, iter, final)括号里为显示的方式
%			Tolx		自变量的精度
%			MaxFunEval	最大的目标函数检查步数
%			MaxIter		最大的迭代步数
%			FunValCheck	检查目标函数数值是否可接受
%			OutputFcns	用户自定义的绘图函数，将在每个迭代步数调用
[x, fval] = fminbnd(...);
%同时返回x和在点x处的目标函数值
[x, fval, exitflag] = fminbnd(..);
%输出参数exitflag返回函数fminbnd的求解状态（成功失败）
%收敛到最优解(1)			达到最大迭代步数(0)
%自定义函数引起的退出(-1)	边界条件不协调(-2)
[x, fval, exitflag, output] = fminbnd(...);
%返回优化算法，函数评价次数，迭代次数，退出信息



%无约束优化问题MATLAB工具箱中的基本函数
X = fminunc(fun, X_0);
%给定初始点X_0，求函数fun的局部最小点X^*	X_0可以是标量向量矩阵
X = fminunc(fun, X_0, options);
%options参数指定的优化参数求函数fun的最小值
%optiions:	Display(off, iter, final, notify)括号里为显示的方式
%			Tolx		自变量的精度
%			MaxFunEval	最大的目标函数检查步数
%			MaxIter		最大的迭代步数
%			FunValCheck	检查目标函数数值是否可接受
%			OutputFcns	用户自定义的输出函数，将在每个迭代步数调用
%			PlotFcns	用户自定义的绘图函数，将在每个迭代步数调用
%			TolFun		目标函数值的精度
[x, fval] = fminunc(...);
%同时返回x和在点x处的目标函数值
[x, fval, exitflag] = fminunc(..);
%输出参数exitflag返回函数fminbnd的求解状态（成功失败）
%收敛到最优解(1)			达到最大迭代步数(0)
%自定义函数引起的退出(-1)	边界条件不协调(-2)
[x, fval, exitflag, output] = fminunc(...);
%返回优化算法，函数评价次数，迭代次数，退出信息
[x, fval, exitflag, output, grad] = fminunc(...);
%返回函数fun在极小值点X的梯度
[x, fval, exitflag, output, grad, hessian] = fminunc(...);
%返回函数fun在极小值点X处的Hessian矩阵

X = fminsearch(fun, X_0);
X = fminsearch(fun, X_0, options);
[X, fval] = fminsearch(...);
[X, fval, exitflag] = fminsearch(...);
[X, fval, exitflag, output] = fminsearch(...);
%i.e.
>>	fx = @(x) -1/((x(1)-2)^2+3)-1/((x(2)+1)^2-5);
	[x, f] = fminsearch(fx, [0, 0]);
ans
	x = 2.0000   -1.0000
	f = -0.1333



%线性规划问题MATLAB工具箱中的基本函数
%			minf(X)
%		{	A*X <= b
%	s.t.{	Aeq*X = Beq
%		{	Lb <= X <= Ub
%
%不等式约束矩阵(A)			等式约束的系数矩阵(Aeq)
%不等式约束的常数向量(b)	等式约束的常数向量(Beq)
%自变量的上下限范围(Lb, Ub)
[X, fval] = linprog(f, A, b);
[X, fval] = linprog(f, A, b, Aeq, Beq);
%若不等式不存在，则令A=[], b=[]
[X, fval] = linprog(f, A, b, Aeq, Beq, Lb, Ub);
[X, fval] = linprog(f, A, b, Aeq, Beq, Lb, Ub, X_0);
%设置初值为X_0
[X, fval] = linprog(f, A, b, Aeq, Beq, Lb, Ub, X_0, options);
%用options指定的优化参数进行最小化
X = linprog(...);
%仅输出解X的值