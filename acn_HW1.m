% Homework 1: Credit Card Payoff Calculator
clc; clear;

balance_owed = input('Balance owed: ');
APR = input('APR Interest Rate (%): ');
monthly_payment = input('Expected Monthly Payment: ');
eff_rate = ((1 + (APR/(100*365)))^30.4167) - 1;

month1=(log(1-(eff_rate*balance_owed)/35))/(-log(1+eff_rate));
month1_ceil = ceil(month1);
total1=month1*35;

month2=(log(1-(eff_rate*balance_owed)/monthly_payment))/(-log(1+eff_rate));
month2_ceil = ceil(month2);
total2=month2*monthly_payment;

 

payment3 = ((eff_rate * balance_owed)/(1-(1 +eff_rate)^(-4)));
total3=payment3*4;

fprintf('Option Payment Months Payoff\n');
fprintf('\t1) $35.00 %g $%.2f \n', month1_ceil, total1);
fprintf('\t2) $%.2f %g $%.2f \n', monthly_payment, month2_ceil, total2);
fprintf('\t3) $%.2f 4 $%.2f \n', payment3, total3);