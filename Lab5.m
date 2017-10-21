close all;
clear all;
clc;

%% read image
filename = 'image.jpg';
filename1 = 'another_picture.jpg';
I = imread(filename);
K = imread(filename1);
figure('name', 'source image');
imshow(I);

%i stored the images of flipping from the images popping out after run
figure('name', 'source image');
imshow(K);

%% ----- pre-lab ----- %%
% output = function(input1, input2, ...);
% grey_scale function
I2 = grey_scale(I);
K2 = grey_scale(K);
%% ----- homework lab ----- %%
% flip function
I3 = flip(I,2);
K31 = flip(K,0);
K32 = flip(K,1);
K33 = flip(K,2);

% rotation function
I4 = rotation(I, pi/6);
I44 = rotation(I, pi/3);
I444 = rotation(I, pi/1.5);
I4444 = rotation(I, pi*1.6);

K4 = rotation(K, pi/6);
K44 = rotation(K, pi/3);
K444 = rotation(K, pi/1.5);
K4444 = rotation(K, pi*1.6);
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

figure('name', 'Kgrey scale image'),
imshow(K2);

figure('name','Kflip_horizontal')
imshow(K31);

figure('name','Kflip_vertical')
imshow(K32);

figure('name','Kflip_horizontal_vertical')
imshow(K33);

figure('name','Krotation 30')
imshow(K4);

figure('name','Krotation 60')
imshow(K44);

figure('name','Krotation 120')
imshow(K444);

figure('name','Krotation 288')
imshow(K4444);
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

filename2 = 'Ktest_image.jpg';
imwrite(K2, filename2);

filename2 = 'Kflip_horizontal.jpg';
imwrite(K31, filename2);

filename2 = 'Kflip_vertical.jpg';
imwrite(K32, filename2);

filename2 = 'Kflip_horizontal_vertical.jpg';
imwrite(K33, filename2);
%i stored the images of flipping from the images popping out after run

filename2 = 'K30_degree.jpg';
imwrite(K4, filename2);

filename2 = 'K60_degree.jpg';
imwrite(K44, filename2);

filename2 = 'K20_degree.jpg';
imwrite(K444, filename2);

filename2 = 'K288_degree.jpg';
imwrite(K4444, filename2);



