close all
clear
clc

% --- read image ---
imdata = imread('test1.jpg');

% --- convert into gray scale ---
% 1. Built in Function of Image Processing Toolbox
coin = rgb2gray(imdata);
% 2. standard NTSC conversion formula
%coin = 0.2989*(imdata(:,:,1))+0.5870*(imdata(:,:,2))+0.1140*(imdata(:,:,3));

figure();
imshow(coin,'InitialMagnification','fit');
title('the grayscale image');


% --- edge detection ---
imbin = edge(coin,'canny');

figure();
imshow(imbin,'InitialMagnification','fit');
title('the edge image');

% --- Hough Transform ---
% depends on the size of coin
rmin=30;
rmax=80; 
p=0.5;
houghcircle = HoughTransformation(imbin,rmin,rmax,p);

figure();
imshow(imdata,'InitialMagnification','fit');
title('circles detected with HT');

% Create circle
% Syntax: viscircles(centers,radii,Name,Value)
viscircles([houghcircle(:,1) houghcircle(:,2)], houghcircle(:,3), 'EdgeColor', 'red', 'LineWidth',4);