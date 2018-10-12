%Robotic Ice Cream
clc; clear; 

fprintf('Welcome to the Ice Cream Kiosk! Make your choices below: \n');
fprintf('Sizes:\t 1) Small\t 2) Regular\t 3) Large\n');
fprintf('Flavors:\t A) Vanilla\t B) Chocolate\t C) Strawberry\t D) Birthday Cake\n');
fprintf('Toppings:\t E) Sprinkles\t F) Hot Fudge\t G) Caramel\t H) Brownie Bites\t I) None\n');

final_price = 0;

size = input('Enter your size: ');

if (size ~= 1 && size ~= 2 && size ~= 3)
    fprintf('Invalid size! Please start another order...\n');
else
    if size == 1
        final_price =3.99;
    elseif size == 2
        final_price = 4.99;
    else
        final_price = 5.99;
    end
    
    flavor = input('Enter your base flavor: ', 's');
    
    if flavor ~= 'A' && flavor ~= 'B' && flavor ~= 'C' && flavor ~= 'D'
        fprintf('Invalid flavor! Please start another order...\n');
    else
        topping = input('Enter your topping: ', 's');
        
        if topping ~= "E" && topping ~= "F" && topping ~= "G" && topping ~= "H" && topping ~= "I" 
            fprintf('Invalid topping! Please start another order...\n');
        elseif topping == 'I'
            final_price = (0.06 * final_price) + final_price;
            fprintf('Final Price with Tax: $%.2f\n', final_price);
        else
            final_price = final_price + 0.99;
            final_price = (0.06 * final_price) + final_price;
            fprintf('Final Price with Tax: $%.2f\n', final_price);
        end    
    end
end