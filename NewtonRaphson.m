% Clear command window, workspace, and close all graphs
clc, clear, close all

% Define constant values
k0 = 12.5;
a = 0.55;
T0 = 550;
TL = 75;

% Define initial guess vector
T = [75 125 250 300]';

N = size(T,1);                   
Kmax = 100;                   
    
for k = 1:Kmax
   
    fprintf('iteration number %19i\n', k);
    
    for i = 1:N
        for j = 1:N
            J(i,j) = Jacobian(i,j,T,k0,a,T0,TL);
        endfor
        
        b(i,1) = f_nonlinear(i,T,k0,a,T0,TL);
        
    endfor
    
    Told = T;
    z = linsolve(J,-b);
    T = Told + z;
    
    for i = 1:N
        Res(i) = f_nonlinear(i,T,k0,a,T0,TL);
    endfor
    
    residual(k) = norm(Res,inf);
    
    % Print iteration results to command window
    fprintf('Residual Norm %22.8e\n\n', residual(k))
    fprintf('Jacobian Matrix at Current Iteration\n')
    fprintf('------------------------------------\n'), disp(J)
    fprintf('\nApproximated Vector Solution\n')
    fprintf('----------------------------\n')
    fprintf('%.8f\n', T(:,1)); 
    fprintf('\n\n');
    
    % Break if converged
    if residual (k) <= 10^-5 
        break
    endif
    
    % Break if diverged
    if residual (k) >= 10^15 
        break
    endif       

endfor
    
%print solution to screen
fprintf('Temperature Vector Solution\n' )
fprintf('---------------------------\n')
fprintf('%.5f\n', T(:,1))

fprintf('\n\nResidual Norm at Every Iteration\n')
fprintf('--------------------------------\n')
fprintf('%.5f \n', transpose(residual(:)))
