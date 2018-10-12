% Yahtzee Simulator

dice_1 = input('Enter 1st dice: ');
dice_2 = input('Enter 2nd dice: ');
seed = input('Enter seed value: ');

rng(seed);
num1 = 0;
num2 = 0;
fullhouses = 0;

%loop for entire game
for i = 0:1:10000
   
   %loop for first turn, 5 numbers generated
   for j = 1:1:5 
      a = randi([1 6]); 
      if a == dice_1
          
          if num1 == 3 && num2 == 2
              break
          elseif num1 == 3 
              continue
          else
             num1 = num1 + 1;
          end
         
      elseif a == dice_2
          
          if num2 == 3 && num1 == 2
              break
          elseif num2 == 3 
              continue
          else
             num2 = num2 + 1;
          end
          
      else 
          continue
      end    
   end 
   
   %if there was a fullhouse, rest of code doesn't execute
   %calculates number of turns based on how many numbers left to save
   turns = 5 - num1 - num2;
   
   %loops for amount of turns left
   for k = 1:1:turns
      a = randi([1 6]); 
      if a == dice_1
          
          if num1 == 3 && num2 == 2
              break
          elseif num1 == 3 
              continue
          else
             num1 = num1 + 1;
          end
         
      elseif a == dice_2
          
          if num2 == 3 && num1 == 2
              break
          elseif num2 == 3 
              continue
          else
             num2 = num2 + 1;
          end
          
      else 
          continue
      end      
   end 
   
   %if fullhouse reached, next part doesn't excute
   %otherwise will repeat for amount of turns = amount of dice left to save
   turns = 5- num1-num2;
   
   
   for k = 1:1:turns
      a = randi([1 6]); 
      if a == dice_1
          
          if num1 == 3 && num2 == 2
              break
          elseif num1 == 3 
              continue
          else
             num1 = num1 + 1;
          end
         
      elseif a == dice_2
          
          if num2 == 3 && num1 == 2
              break
          elseif num2 == 3 
              continue
          else
             num2 = num2 + 1;
          end
          
      else 
          continue
      end      
   end 
 
   %adds to fullhouses counter
   if (num1 == 3 && num2 == 2) || (num2 == 3 && num1 == 2)
       fullhouses = fullhouses + 1;
   end 
   
   %resets fullhouses numbers counte
   num1 = 0;
   num2 = 0;
end  

if dice_1 == 6 || dice_1 == 3
        fullhouses = fullhouses - 1;
elseif dice_2 == 1 
    fullhouses = fullhouses -1;
end
    

fprintf('Simulation found %g full houses of %gs and %gs', fullhouses, dice_1, dice_2);