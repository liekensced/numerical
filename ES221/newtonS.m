function [sol] = newtonS(f,df,x0, tol,nmax)
% F MUST BE VERTICAL eg [1;x;x+2]
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
