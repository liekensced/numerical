function [hist] = chord(f,x0,tol,max,n)
    syms x
    df = matlabFunction(diff(f(x)));

    g = @(x) (x - f(x)/df(x0));
    
    ni = 0;
    hist = zeros(max,1);
    hist(1) = x0;
    for i = 1:max
        hist(i+1) = g(hist(i));

        ni = ni +1;
        if(ni == n)
            ni = 0;
            g = @(x) (x - f(x)/df(hist(i+1)))
        end
        
        if(hist(i) - hist(i+1)<tol)
            hist(i+1)
            break
        end
    end
    hist = hist(1:i+1);
    myPlot(hist',g)
end


function [] = myPlot(hist,g)
plot(1:length(hist),hist)
xlabel("Iteration")
ylabel("abs(y)")
syms s
fplot(g(s))
hold on
fplot(s, "--")
doubledHistory = [1;1]*hist;
doubledHistory = doubledHistory(:)';
plot(doubledHistory(1:end-1), doubledHistory(2:end))
hold off
end