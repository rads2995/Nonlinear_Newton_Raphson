% This function generates the simultaneous equations
function [function_value] = f_nonlinear(i,T,k0,a,T0,TL)

    if i == 1
        func = (k0+(a/2)*(T(1)+T0))*T0-(2*k0+(a/2)*(T0+2*T(1)+T(2)))*T(1)...
                + (k0+(a/2)*(T(1)+T(2)))*T(2);
    end

    if i == 2
        func = (k0+(a/2)*(T(2)+T(1)))*T(1)-(2*k0+(a/2)*(T(1)+2*T(2)+T(3)))*T(2)...
                + (k0+(a/2)*(T(2)+T(3)))*T(3);
    end

    if i == 3
        func = (k0+(a/2)*(T(3)+T(2)))*T(2)-(2*k0+(a/2)*(T(2)+2*T(3)+T(4)))*T(3)...
                + (k0+(a/2)*(T(3)+T(4)))*T(4);
    end

    if i == 4
        func = (k0+(a/2)*(T(4)+T(3)))*T(3)-(2*k0+(a/2)*(T(3)+2*T(4)+TL))*T(4)...
                + (k0+(a/2)*(T(4)+TL))*TL;
    end

function_value = func;

endfunction
