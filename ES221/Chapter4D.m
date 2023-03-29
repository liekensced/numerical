%% 4.20
clear all; clc; close all;

syms x
f(x) = tan(x-1);
% fplot(f(x))
newton(matlabFunction(f(x)),2,1e-14,1000)

%% 4.21

f = @(x) x.*cosh(50./x) - 12 - x;
x = linspace(0, 150);
plot(x,f(x));
hold on
ylim([-10 1000]);

x0=12;
nmax=1000;
tol=1e-10;

% opl_ex_1 = fzero(f,x0)
opl_ex_2 = fsolve(f,x0)
hold off
opl_3 = newton(f,x0,tol,nmax, false)
%% 4.22 zie Chapter4C
%% 4.23
syms x f(x)
f(x) = x^3 - x;
fnplot(f(x))

% Draws a little animation (but takes time to execute):

% for k = 0:0.01:1
%     newton(matlabFunction(f(x)),k,1e-10,100)
%     drawnow
% end
%% 4.25

syms x f(x)
f(x) = x^3-3*x+2;

newton(f,2,-1,21)
%% 4.29

f = @(x,y) x^2+(y-1)^2 - 2;
g = @(x,y) 3*x-y - 1;

F = @(X) [f(X(1),X(2)); g(X(1),X(2))];

syms x y
fimplicit(f(x,y))
hold on
fimplicit(g(x,y))
axis equal

% Another attempt at calculating df :/
% df_sym = inv(jacobian(F([x y]')));
% df_ml = matlabFunction(df_sym)
% df = @(X) df_ml(X(1),X(2))

%newtonS(F, df, [1 1]',1e-8,5) %& find jacobian (df) etc etc
