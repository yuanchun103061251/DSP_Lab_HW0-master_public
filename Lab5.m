close all;
clear all;
clc;

%% read image
filename = 'image.jpg';
I = imread(filename);
figure('name', 'source image');
imshow(I);

%% ----- pre-lab ----- %%
% output = function(input1, input2, ...);
% grey_scale function
I2 = grey_scale(I);

%% ----- homework lab ----- %%
% flip function
I3 = flip(I,2);

% rotation function
I4 = rotation(I, pi/6);
I44 = rotation(I, pi/3);
I444 = rotation(I, pi/1.5);
I4444 = rotation(I, pi*1.6);


%% show image
figure('name', 'grey scale image'),
imshow(I2);

figure('name','flip')
imshow(I3);

figure('name','rotation 30')
imshow(I4);

figure('name','rotation 60')
imshow(I44);

figure('name','rotation 120')
imshow(I444);

figure('name','rotation 288')
imshow(I4444);
%% write image
% save image for your report
filename2 = 'test_image.jpg';
imwrite(I2, filename2);

%i stored the images of flipping from the images popping out after run

filename2 = '30_degree.jpg';
imwrite(I4, filename2);

filename2 = '60_degree.jpg';
imwrite(I44, filename2);

filename2 = '120_degree.jpg';
imwrite(I444, filename2);

filename2 = '288_degree.jpg';
imwrite(I4444, filename2);





