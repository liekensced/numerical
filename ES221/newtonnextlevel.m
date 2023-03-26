clear all

% Enter function here
% Note: X(1) would be x and X(2) is y
F = @(X) [X(1)^2 - X(1)+X(2)^2; X(1)^2 - X(2)-X(2)^2];

% Enter Jacobian manually.
% You could use (now 2 dimensions):
% syms x, y
% df_sym = inv(jacobian(F([x y]))) 
%
% and subsitute all x with X(1) ...
%
% I can't get this to work automatically for n dimensions :/

df = @(X) [2*X(1) - 1,       2*X(2);    2*X(1), - 2*X(2) - 1];

fsurf(F([x,y]))

newton(F, df, [0.8 0.4]', 1e-6, 200)


function [sol] = newton(f,df,x0, tol,nmax)
    if(norm(f(x0))<tol)
        sol = x0;
        return
    end
    
    sol = zeros(length(x0), nmax);
    sol(:,1) = x0;

    for i= 1:nmax
        X = sol(:,i);
        sol(:,i+1) = X - df(X)\f(X);
        
        if(norm(f(X))<tol)
            sol = X;
            
            return
        end
    end

end