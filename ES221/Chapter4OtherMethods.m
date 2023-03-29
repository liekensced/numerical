%% Oefening 4.18
clear all; close all; clc; format long

g = @(x) sin(x) -x/2 -pi/6 + sqrt(3)/2;
fplot(g)
grid on
a = -4;
b = 4;
tol = 10^-10;
nmax = 100;
x0 = -pi/2;
res_1 = bisection(g,a,b,nmax,tol, false)
res_2 = newton(g,x0,tol,nmax)
res_3 = newtonadaptive(g,x0,1,1,tol,nmax)

%% Theorie oef 4.7

    f = @(x,p) (x^2-1)^p * log(x);

tiledlayout(3,1)

for p = [2 4 6]
    nexttile
    [res, mhist] = newtonadaptive(@(x) f(x,p), 0.8,0.9,0.95,1e-16,50);
    plot(res)
    hold on
    plot(mhist, "--")
    hold off

end


function cheb(x0,fun,min)
    syms x 
    Df(x) = diff(fun(x),x,1);
    DDf(x) = diff(fun(x),x,2);
    while true
        T1 = fun(x0)/Df(x0); %Alle termen van het verschil hier uitschrijven
        T2 = 1/2*(fun(x0)/Df(x0))^2;
        T3 = DDf(x0)/Df(x0);
        c = x0 - T1 - T2*T3;
        if logical(abs(c-x0)>= min)
            x0 = c;
        else
            sprintf("Het antwoord is %0.5g",c)
            break
        end
        continue
    end
end

%Newton adaptive

function [res, mHist] = newtonadaptive(f, x1, x2, x3, tol, nmax)
    res = [x1;x2;x3;zeros(nmax,1)];
    syms x
    df = matlabFunction(diff(f(x)));
    mHist = [0 0 0];
    for i = 3:nmax
        if (2*res(i-1) - res(i) - res(i-2)) == 0
            disp("Denomenator equals zero!")    
        end
        m = (res(i-1)-res(i-2))/(2*res(i-1) - res(i) - res(i-2));
        mHist(length(mHist)+1) = m;
        if df(res(i)) == 0
            disp("Denomenator equals zero!")
            return
        end
        res(i+1) = res(i) - m*(f(res(i))/df(res(i)));
        if(abs(f(res(i+1)))<tol)
            res = res(1:i+1);
            return
        end
    end
end

%Steffenson

function stef(x0,fun,min)
    while true
        Df = (fun(x0 + fun(x0)) - fun(x0))/fun(x0);
        c = x0 - fun(x0)/Df;
        if logical(abs(c-x0)>= min)
            x0 = c;
        else
            sprintf("Het antwoord is %0.5g",c)
            break
        end
        continue
    end
end

