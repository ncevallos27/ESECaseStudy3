load lightField.mat;

figure()
img = rays2img(rays(1,:),rays(3,:),.006, 600);
imagesc(img);
colormap("gray");
% changing the sensor width : 
% changing the pixel : 

d2= 0.189;
focal = .12838;
d1= 1/((1/focal) - (1/d2));

Md = [1 d1 0 0; 
      0 1 0 0; 
      0 0 1 d1; 
      0 0 0 1];

figure();
rays_2 = Md * rays ; 
img_2 = rays2img(rays_2(1,:),rays_2(3,:),.006,600);
imagesc(img_2);
colormap("gray");



figure()
M_f = [1 0 0 0; 
    -1/focal 1 0 0;
    0 0 1 0; 
    0 0 -1/focal 1];

rays_3 = M_f * rays ; 

img_3 = rays2img(rays_3(1,:),rays_3(3,:),.006, 600);
imagesc(img_3);
colormap("gray");


Md2 = [1 d2 0 0; 
      0 1 0 0; 
      0 0 1 d2; 
      0 0 0 1];

figure()
rays_4 = Md2 * rays_3 ; 

img_4 = rays2img(rays_4(1,:),rays_4(3,:),.006, 600);

% Flips the image by reversing the elements in each row
Image_Flip = flip(img_4,2);


imagesc(Image_Flip);
colormap("gray");

%not done