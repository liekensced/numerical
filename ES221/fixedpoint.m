function [x, hist] = fixedpoint(f,g,x0,tol,max, showPlot)
% NOTE If tol == -1 then it will use max as amount of iterations 
arguments
    f
    g
    x0
    tol
    max = 100
    showPlot = true
end
    [x, hist] = fixedpoint_rec(f,g,x0,tol,max, [],showPlot);
end


function [xout, hist] = fixedpoint_rec(f,g,x,tol,max,hist,showPlot)
    y = f(x);
    hist(length(hist)+1) = x;
    if max <= 0
        if (tol < 0)
            disp("Used max as amount of iterations (tolerance is negative)")
        else
            disp("Couldn't found x")
        end
        xout = x;
        if(showPlot)
            myPlot(hist,g); 
        end
    % CHANGE HERE how to check tolerance
    % NOTE: history saves the x value, not perfect as I'm calculating twice
    % f(x)... but if you store y in history you can't plot the steps.
    % 
    % Other clause:
    % (length(hist) > 2) && f(hist(length(hist)-1)) - abs(y) < tol 
    elseif abs(y) < tol 
        if(showPlot)
            myPlot(hist,g);
        end
        disp("toleration: " + num2str(tol))
        disp("Iterations: " + num2str(length(hist)))
        xout = x;
    else
        [xout, hist] = fixedpoint_rec(f,g,g(x),tol,max-1, hist,showPlot);
    end
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