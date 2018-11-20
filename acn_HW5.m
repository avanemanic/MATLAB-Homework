%Homework 5: Yahtzee scoring system
clc; clear;
dice = input('Enter your 5 dice in []: ');
dice_copy = sort(dice);
count = 0;

%4 of a kind
four = 0;
for i = 1:1:4
    if dice_copy(1) == dice_copy(i)
        four = four +1;
    elseif dice_copy(2) == dice_copy(i)
        four = four+1;
    end
end
if four == 4
        fprintf('4 of a kind: \t %g points\n', sum(dice));
else
   fprintf('4 of a kind: \t 0 points\n') 
end

%Full house
min = min(dice_copy);
max = max(dice_copy);
fullhouse_1 =0;
dice_min = find(dice == min);
dice_max = find(dice == max);
matches_min = length(dice_min);
matches_max = length(dice_max);
if matches_min == 3 && matches_max == 2
    fprintf('Full house: \t 25 points\n')
elseif matches_max == 3 && matches_min == 2
    fprintf('Full house: \t 25 points\n')
else 
    fprintf('Full house: \t 0 points\n')
end


%Small straight
small = 0;
for i = 1:1:4
    if dice_copy(i+1) ~= dice_copy(i) + 1
       
    else
        small = small + 1;
        if small == 3
            break
        end    
    end
end 
if small == 3
    fprintf('Small Straight: \t 30 points\n')
else
    fprintf('Small Straight: \t 0 points\n')
end
    

%Large straight
l_str = 0;
for i = 1:1:4
    if dice_copy(i+1) ~= dice_copy(i) + 1
        l_str = 0;
        break
    else
        l_str = 1;
    end
end 
if l_str == 0 
    fprintf('Large Straight: \t 0 points\n')
else
    fprintf('Large Straight: \t 40 points\n')
end
    
%Yahtzee
for i = 1:1:5
    if dice(1) ~= dice(i)
        count = 1;
        fprintf('Yahtzee: \t 0 points\n')
        break
    end
end
if count == 0 
    fprintf('Yahtzee: \t 50 points\n')
end

%Chance
fprintf('Chance: \t %g points\n', sum(dice));

