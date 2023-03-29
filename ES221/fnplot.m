function fnplot(f)
    % Like fplot but it shows zeros and other stuff
    fplot(f)
    syms x
    x0 = solve(f==x);
    hold on
    legend()
    plot(x0,0,"*")
    grid on
    hold off
end