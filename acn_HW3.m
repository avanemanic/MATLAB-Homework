% Square Root Algorithm
clc; clear;

square = input('Enter any numeric value: ');
negative = 0;

if (square < 0) 
         square = square * -1;
         negative = 1;
end
    
if (square == 0)
    fprintf('The square root of 0 is simply 0\n');
else
    
    x_old = input('Enter an initial guess: ');  
    iterations = 1;
    
    x_new = 0.5*(x_old + (square / x_old));
    error = ((x_new*x_new)/square) - 1;
    x_old = x_new;

    while (error > 0.000000001) 
        x_new = 0.5*(x_old + (square / x_old));
        error = ((x_new*x_new)/square) - 1;
        x_old = x_new;
        iterations = iterations + 1;
    end  
    
    if (negative == 1)
        square = square * -1;
        fprintf('Algorithm completed in %g iterations', iterations);
        fprintf('\nThe square root of %g is %gi\n', square, x_new);
    else
        fprintf('Algorithm completed in %g iterations', iterations);
        fprintf('\nThe square root of %g is %g\n', square, x_new);
    end    
    
end    