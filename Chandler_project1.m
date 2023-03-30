%Program: Chandler_project1.m
%Purpose: Find quantity of an item that will produce maximum profit and
%graph the curve with a red dot to show the maximum point
%Author: Thomas Chandler
%Date: February 5, 2022

disp('This program will calculate the quantity sold necessary for maximum profit.')
disp('This is only for a perfectly competitive market in the long run (annualy).')
disp('Example: Market price for a pound of butter is $4 and it costs $1 to')
disp('produce each pound. Annual fixed costs for the producers are $1000/year.')
disp('Maximum profit would be attained at 15,000 pounds of butter.')
disp('Note: This finds the profit maximum but your profit may still be negative(loss).')


prom1 = 'Input the price of the commodity (single unit): ';
price = input(prom1);

prom2 = 'Input the annual fixed costs: ';
fixed = input(prom2);

prom3 = 'Input the variable costs (how much it costs to make each item): ';
v_cost = input(prom3);

%Pass values to function to calculate profit max
[Z, S] = maxprofit(price, fixed, v_cost);
    
%Find x-intercepts for graphing and round and convert them
x1 = Z == 0;
syms x
x12 = solve(x1, x);
a = double(round(x12(1)));
b = double(round(x12(2)));

%Find y at profit max and scale to better show apex of curve
x = S;
y = double(subs(Z));
yscale = y * 1.1;


%display final result
format bank
d = double(S);
disp(['Profit is maximized at ', num2str(d), ' units sold with a profit', ...
    ' of $', num2str(y)])

%Begin graphing by plotting line and specifying x axis size
fplot(Z, [a b]);
hold on

%Mark the point of profit maximization with a red point
plot(S, y, '.r-')


%Specify y axis size to make sure curve is shown clearly
ylim([-inf yscale]);


%Label axes and give graph a title
xlabel('Quantity')
ylabel('Profit')
title('Profit Maximization')

