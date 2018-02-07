i=imread('C:\Users\user\Desktop\akki\sample.jpg');
i=rgb2gray(i);
%imshow(i);
%title('Original')
subplot(2,3,1);
imhist(i);
title('Original histogram');
subplot(2,3,4);
imshow(i);
title('Original');

i=imnoise(i,'salt & pepper',0.05); 
%figure,imshow(i)
%title('Noisy')
%figure,imshow(i)
subplot(2,3,2);
imhist(i);
title('Noisy histogram');
subplot(2,3,5);
imshow(i);
title('Noisy');

p=input('Enter the size of kernel of median filter, (n for nxn matrix):');
pad=uint8(zeros(size(i)+2*(p-1)));

for x=1:size(i,1)
            for y=1:size(i,2)
                pad(x+p-1,y+p-1)=i(x,y);
            end
end 

 for i= 1:size(pad,1)-(p-1)
    for j=1:size(pad,2)-(p-1)
        kernel=uint8(ones((p)^2,1));
        t=1;
        for x=1:p
          for y=1:p
                kernel(t)=pad(i+x-1,j+y-1);
                t=t+1;
          end
        end
        filt=sort(kernel);
        out(i,j)=filt(ceil(((p)^2)/2));
    end
 end
%title('5-Median Filtered')
subplot(2,3,3);
imhist(out);
title('Histogram');
subplot(2,3,6);
imshow(out);
title('Median Filtered');