load lightField.mat;

figure()
img = rays2img(rays(1,:),rays(3,:),.65, 2900);
imagesc(img);
colormap("gray");
% changing the sensor width :
% changing the pixel :

d3= 0.25;
Md = [1 d3 0 0; 
      0 1 0 0; 
      0 0 1 d3; 
      0 0 0 1];

figure();
rays_2 = Md * rays ; 
img_2 = rays2img(rays_2(1,:),rays_2(3,:),.5,5000);
imagesc(img_2);
colormap("gray");

focal = .08;

figure()
M_f = [1 0 0 0; -1/focal 1 0 0; 0 0 1 0; 0 0 -1/focal 1];
rays_3 = M_f * rays ; 
img_3 = rays2img(rays_3(1,:),rays_3(3,:),.5, 3050);
imagesc(img_3);
colormap("gray");

%not done
