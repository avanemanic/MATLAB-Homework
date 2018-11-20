%Cipher Decoder
clc; clear;

msg_1 = input('Enter message to decrypt: ', 's');
msg = msg_1;
key = input('Enter secret key: ', 's');

pos = 1;
shift =0;
cnt = 1;

for i = 1:1:length(msg)
    if isstrprop(msg(length(msg)+1-i), 'upper')
        shift = (msg(length(msg)+1-i)-upper(key(cnt)))*-1;
          if shift < 0
            shift = shift +26;
        end   
        %msg(length(msg)+1-i)= 65;
        msg(length(msg)+1-i)= msg(length(msg)+1-i)+(shift);
        cnt = cnt +1;
        while msg(length(msg)+1-i) > 'Z'
             msg(length(msg)+1-i) = msg(length(msg)+1-i)-26;
         end    
        if cnt == length(key) +1
            cnt = 1;
        end 
    elseif isstrprop(msg(length(msg)+1-i), 'lower')
        shift = (msg(length(msg)+1-i)-lower(key(cnt)))*-1;
        if shift < 0
            shift = shift +26;
        end    
        %msg(length(msg)+1-i)= 97;
        msg(length(msg)+1-i)= msg(length(msg)+1-i)+(shift);
        cnt = cnt +1;
        while msg(length(msg)+1-i) > 'z'
            msg(length(msg)+1-i) = msg(length(msg)+1-i)-26;
            %fprintf('%s', msg);
        end 
         if cnt == length(key) +1
            cnt = 1;
         end 
    
    end
    
end

fprintf('Updated key: %s\n', msg);

move = 0;
for j = 1:1:length(msg)
    move = (msg_1(j)-msg(j));
    if move < 0
        move = move +26;
    end  
    %fprintf('%g\n', move)
    if isstrprop(msg_1(j), 'upper')
        msg_1(j)=65;
        msg_1(j)=msg_1(j)+move;
    elseif isstrprop(msg_1(j), 'lower')
        msg_1(j)=97;
        msg_1(j)=msg_1(j)+move;
    end
end
fprintf('Decrypted msg: %s', msg_1)
