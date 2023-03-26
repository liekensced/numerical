function [x, hist] = newton(f,x0,tol,max)
   syms x
   g = matlabFunction(x - f(x)/diff(f(x)));
   %gCord = matlabFunction(x - f(x)/diff(f(x0)))
   [x, hist] = fixedpoint(f,g,x0,tol,max);  
end