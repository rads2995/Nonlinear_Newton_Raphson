% This routine produces the Jacobian element Ji,j
function [ Jac ] = Jacobian(i,j,T,k0,a,T0,TL)
    
    del = 10^-5;

    beta(:,1) = T(:,1);
    beta(j,1)= beta (j,1)- del;
    Jac = (f_nonlinear(i,T,k0,a,T0,TL)-f_nonlinear(i,beta,k0,a,T0,TL))/del ;

endfunction