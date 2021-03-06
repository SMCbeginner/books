% Filtering the Fourier transform and then inverse
% high-pass circle filter

keaton=imread('keaton2bw.tif'); %read the image file into a matrix
[ly,lx]=size(keaton); %determine image size
dx=(0:(lx-1))-round(lx/2); dy=(0:(ly-1))-round(ly/2);
[x,y]=meshgrid(dx,dy); %a grid with the same size as image, with center (0,0)
R=sqrt((x.^2)+(y.^2));
circ=(R>16); %circle (high-pass filter)

FKe=fftshift(fft2(keaton)); %Fourier transform
FKefil=FKe.*circ; %filtering in the frequency domain
IKe=ifft2(FKefil); %inverse transform
uIKe=uint8(abs(IKe)); %convert to unsigned 8-bit

figure(1)
subplot(1,2,1)
imshow(keaton); %display the photo
title('Fourier circle high-pass filtering');
ylabel('original');
subplot(1,2,2)
imshow(circ); %the filter
ylabel('the filter');

figure(2)
imshow(uIKe);
title('filtered image');