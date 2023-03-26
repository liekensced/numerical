function [x] = bisection(f, a, b, tol, max, showPlot)
    arguments
        f
        a
        b
        tol
        max
        showPlot = true
    end
    if(f(a)*f(b)>0)
        disp("a and b do not pass 0!")
    end

    if(f(a)<f(b))
        x = bisection_R(f, a, b, tol, max, [],showPlot);
    else
        x = bisection_R(f, b, a, tol, max, [],showPlot);
    end
end

function [x] = bisection_R(f, a, b, tol, max, hist,showPlot)
    c = (a+b)/2;
    y = f(c);
    hist(length(hist)+1) = abs(y);
    if max <= 0
        disp("Couldn't found x")
        x = c;
    elseif abs(y) < tol
        if(showPlot)
            semilogy(1:length(hist),hist)
            xlabel("Iteratie"); ylabel("f(x0)")
        end
        disp("toleration: " + num2str(tol))
        disp("Iterations: " + num2str(length(hist)))
        disp("Theory?: " + num2str(log2(100/tol))) % Theoretical, IDK wronk
        x = c;
    elseif y < 0
        x = bisection_R(f,c,b,tol,max-1, hist,showPlot);
    else
        x = bisection_R(f,a,c,tol,max-1, hist,showPlot);
    end
end