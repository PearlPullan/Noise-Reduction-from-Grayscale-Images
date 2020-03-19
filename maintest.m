clc
clear all
close all

%----------------------------TEST IMAGES---------------------------------

% p = im2double(imread('C:\Users\HP\Desktop\Major project\Minor Project\test images\boat.png'));
% p = im2double(rgb2gray(imread('C:\Users\HP\Desktop\Major project\Minor Project\test images\airplane.png'))) ;
 p = im2double(rgb2gray(imread('C:\Users\HP\Desktop\Major project\Minor Project\test images\peppers.png'))) ;
 
%p = im2double(imread('C:\Users\HP\Desktop\MP\test images\goldhill.bmp'));
% p = im2double(imread('C:\Users\HP\Desktop\MP\test images\lena.bmp'));

%--------------------------------------------------------------------------


%------------------------EXTRA CODE FOR BMP INDEXED IMAGES-----------------
%[X,map] = imread('C:\Users\HP\Desktop\MP\test images\goldhill.bmp');
%p = ind2rgb(X,map);
%--------------------------------------------------------------------------
%imshow(p) 
%p = histeq(p) ;
p_noisy = p  ;

N=1:262144;

%_________________________ADDING NOISE__________________________________

%Excluding borders
%                                                                                                                                          

left_border =1:512;
low_border=512*left_border;
up_border=low_border+1;
right_border=261634:262143;
border=[left_border low_border up_border right_border];

not_border=setdiff(N,border);

[row col]=size(not_border);

rind=randperm(col,52000);
                
for i=1:52000
 noise = randn ;
 j=0;
 while j<100000 
   
     noise  = randn ;
     if ((p_noisy(not_border(rind(i)))) + noise >= 0) && (((p_noisy(not_border(rind(i)))) + noise)<= 1)
         val=p_noisy(not_border(rind(i))) + noise ;
         break;
     end
     
 end
 
p_noisy(not_border(rind(i)))= val ;
end

p_noisy_copy=p_noisy;


%__________________________DENOISING_______________________


[row col]=size(p);%storing size of Image

for i=2:1:row-1%sweeping through rows
    
    for j=2:1:col-1%sweeping through columns
    
       a=p_noisy(i-1,j-1);
       b=p_noisy(i-1,j);
       c=p_noisy(i-1,j+1);
       d=p_noisy(i,j-1);
       fij = p_noisy(i,j) ;
       e=p_noisy(i,j+1);
       f=p_noisy(i+1,j-1);
       g=p_noisy(i+1,j);
       h=p_noisy(i+1,j+1);
       
       if ISOLATE(fij,a,b,c,d,e,f,g,h)==true %Doesn't belong to a smooth region
            if FRINGE(fij,a,b,c,d,e,f,g,h)==true %NOT AN EDGE so noisy
               p_noisy(i,j)= EDGEDETECTION(fij, a,b,c,d,e,f,g,h );
            else
              if SIMILARITY(fij,a,b,c,d,e,f,g,h) 
                  p_noisy(i,j)= EDGEDETECTION( fij,a,b,c,d,e,f,g,h );
              end 
              
            end 
            
       end
       
    end
    
end

 


[peakn ,snrn] = psnr(p_noisy_copy,p)
[peakRI snrRI] = psnr(p_noisy, p) 

figure ;
%subplot(1,3,1) ;
%Imhist(p)
%title('Histogram of Original image') ;
%subplot(1,3,2) ;
imhist(p_noisy_copy) ;
%title('Histogram of Noisy image') ;
%subplot(1,3,3)
figure
imhist(p);
%title('Histogram of Reconstructed Image HM')


figure 
%subplot(1,3,1)
%imshow(p);
%title('Original Image') ;
%subplot(1,3,2)
%imshow(p_noisy_copy);
%title('Noisy Image') ;
%subplot(1,3,3)
%imshow(p_noisy) ;
%title('Reconstructed Image HM ')
%imshow([p p_noisy_copy])


