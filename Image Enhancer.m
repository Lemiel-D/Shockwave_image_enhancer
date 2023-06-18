%Code for image processing and enhancement using MATLAB
clc;
%reading the image file 
X = imread ('C:\Users\hp\Downloads\Oblique Shock.jpg'); 
%converting RGB image to grayscale
A = rgb2gray(X);
    imshow(A);
    title('RGB to grayscale image of the oblique shock');
%image trimming
B = imsubtract(A,300);
    imshow(B);
for i = 1:684
for j = 1:637  
  if(A(i,j) <= 5)
    B(i,j)= 50;
  else
    B(i,j) = A(i,j);
  end
end
end
imshow(B);
title('Trimmed grayscale image of the oblique shock');
%Image filtering
for i = 1:684
for j = 1:637
   if B(i,j)<= 40
      C(i,j) = 0.6*B(i,j);
   else
      C(i,j) = 1.2*B(i,j);
   end
end
end
imshow(C);
title('Filtered grayscale image of the oblique shock');
%pixel treatment of the image 
%image processing
  D = fspecial('average',[1 1]);
   for i = 1:20
       E = imfilter(C,D,'replicate');
       C = E;
   end
    imshow(C);
    title('Processed grayscale image of the oblique shock'); 
subplot(1,2,1);
   imshow(A);
   title('RGB to grayscale image of the oblique shock');  
subplot(1,2,2);
    imshow(C);
    title('Processed grayscale image of the oblique shock');
%histogram of the RGB image to see the picture intensity    
subplot(2,2,1);
   imhist(A);
   title('Histogram of the RGB to grayscale image of the oblique shock');
%histogram of the grayscale image to see the picture intensity    
subplot(2,2,2);
   imhist(C);
   title('Histogram of the Processed grayscale image of the oblique  shock');
