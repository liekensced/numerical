function [zero, res] = secant(f,x0,x1,tol,nmax)
% secant(f,x0,tol,nmax)
% secant implementation
%f : function handle
%    function we want to solve
%x0: number (float64)
%    initial value
%x1: number (float64)
%    second value
%tol: number (float64)
%    stopcriterium
%nmax: number
%    max number of iterations

    if abs(f(x0))<tol
        res = x0;
        return
    elseif abs(f(x1))<tol
        res = x1;
        return
    else
        % iteratief proces
        res = zeros(1,nmax);
        res(1) = x0; % eerste waarde fixeren
        res(2) = x1; % tweede waarde fixeren
        for i = 3:nmax
            res(i) = res(i-1) - f(res(i-1)) / ( (f(res(i-1)) - f(res(i-2)) )/( res(i-1) - res(i-2) ));
            %g =  (x(i)-f(x(i)))/((f(x(i))-f(x-1))/(x(i)-x(i-1)));
            %res(i) = g(res(i-1)); % nieuwe waarde
           %stopvoorwaarde
           % if ahs(abs(res(i)))
           if abs(f(res(i))) < tol
               break
           end
        end
        format long
        res = res(1:i); % enkel de waarden die gebruikt zijn 
        zero = res(end);
    end
end
