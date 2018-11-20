%image decoder
clc; clear;
filename = input('Enter file name: ', 's');
pixels = imread(filename);
[h,w,p] = size(pixels);
blank = uint8(zeros(h,w,3));
blank_copy=uint8(zeros(h,w,3));

%rearranging the pixels
for r = 1:1:h
    for c = 1:1:w
        for color = 1:1:3
            if c < w/2 +1
                new_col = (w/2)+1-c;
                if mod(r,2) == 0
                    blank(r/2, new_col, color) = pixels(r,c,color);
                else
                    new_row = ((r+1)/2) + (h/2);
                    blank(new_row, new_col, color) = pixels(r,c,color);
                end
            else
                new_col = ((3*w)/2)+1-c;
                if mod(r,2) == 0
                    blank(r/2, new_col, color) = pixels(r,c,color);
                else
                    new_row = ((r+1)/2) + (h/2);
                    blank(new_row, new_col, color) = pixels(r,c,color);
                end
              
            end        
        end
    end
end

%changing the colors
blank(:,:,1)=blank(:,:,1)*3;
blank(:,:,2)=blank(:,:,2)*0;
blank(:,:,3)=blank(:,:,3)*3;

%copy of second image
blank_copy = blank;

countu=1;
rowc = h;
colc= w;

row_c = h;
col_c= w;

for r=1:1:h/2
    row_c=h-r+1;
    
    for c=countu:1:w-countu+1
        blank_copy(r, c,:)=blank(row_c,c, :);
        blank_copy(row_c, c,:)=blank(r,c,:);
        %col_c=col_c-c+1;
        
    end
    countu=countu+1;
end

%changes file name and saves it
file2 = strrep(filename,'Puzzle.png','Fixed.png');
imwrite(blank_copy, file2)
fprintf('Corrected image saved to %s', file2);

imshow(blank_copy)
