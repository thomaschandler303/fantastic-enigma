%Script to calculate maximum profit and return value and equation to be
%graphed
%Author: Thomas Chandler
%Date: February 5, 2022

function [Z, S] = maxprofit(price, fixed, v_cost)

    %store functions in variables for 
    syms x
    expr1 = price;
    expr2 = v_cost + .0002*x;
    
    %Solve integral of revenue and cost function and combine them
    F = int(expr1, x);
    G = int(expr2, x);
    Z = F - (G + fixed);
     
    %Differentiate profit maximizing function
    syms f(x)
    f(x) = Z;
    Z_d = diff(f, x);
   
    %Solve new equation for x to find quantity for max profit
    S = solve(Z_d, x);

end