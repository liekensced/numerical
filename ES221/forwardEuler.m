function [t, y] = progEuler(odefun, tspan, h, y0)
    t = (tspan(1):h:tspan(2))';
    y = zeros(length(t), 1);
    y(1) = y0;

    for i = 1:length(y)-1
        y(i+1) = y(i) + h * odefun(t(i),y(i));
    end
end