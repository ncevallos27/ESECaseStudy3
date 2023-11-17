point1 = [zeros(1, 8); linspace(-pi/20, pi/20, 8); zeros(1, 8); zeros(1, 8)];
point2 = [0.01*ones(1, 8); linspace(-pi/20, pi/20, 8); zeros(1, 8); zeros(1, 8)];
%point3 = [-0.01*ones(1, 8); linspace(-pi/20, pi/20, 8); zeros(1, 8); zeros(1, 8)];
point3 = [zeros(1,8); zeros(1,8); zeros(1, 8); zeros(1, 8)];

d1 = 0.2;

M_d1 = [1 d1 0 0; 0 1 0 0; 0 0 1 d1; 0 0 0 1];

point1Prime = zeros(4, 8);
point2Prime = zeros(4, 8);
point3Prime = zeros(4, 8);
for c = 1:length(point1)
    point1Prime(:, c) = M_d1*point1(:, c);
    point2Prime(:, c) = M_d1*point2(:, c);
    point3Prime(:, c) = M_d1*point3(:, c);
end

ray_z1 = [zeros(1,size(point1,2)); d1*ones(1,size(point1,2))];
ray_z2 = [zeros(1,size(point2,2)); d1*ones(1,size(point2,2))];
ray_z3 = [zeros(1,size(point3,2)); d1*ones(1,size(point3,2))];

% first figure just one free space propagation
figure
plot(ray_z1, [point1(1,:); point1Prime(1,:)], "Color", "r");
hold on
plot(ray_z2, [point2(1,:); point2Prime(1,:)], "Color", "b");
plot(ray_z3, [point3(1,:); point3Prime(1,:)], "Color", "g");

focal = 0.15;
radius = 0.02;

remainingRays1 = zeros(4,1);
remainingRays2 = zeros(4,1);
remainingRays3 = zeros(4,1);
count1 = 1;
count2 = 1;
count3 = 1;
for c = 1:length(point1Prime)
    if abs(point1Prime(1, c)) <= radius
        remainingRays1(:, count1) = point1Prime(:, c);
        count1 = count1 + 1;
    end
    if abs(point2Prime(1, c)) <= radius
        remainingRays2(:, count2) = point2Prime(:, c);
        count2 = count2 + 1;
    end
    if abs(point3Prime(1, c)) <= radius
        remainingRays3(:, count3) = point3Prime(:, c);
        count3 = count3 + 1;
    end
end

M_f = [1 0 0 0; -1/focal 1 0 0; 0 0 1 0; 0 0 -1/focal 1];
for c = 1:count1-1
    remainingRays1(:, c) = M_f*remainingRays1(:, c);
end
for c = 1:count2-1
    remainingRays2(:, c) = M_f*remainingRays2(:, c);
end
for c = 1:count3-1
    remainingRays3(:, c) = M_f*remainingRays3(:, c);
end

d2 = 0.2;
    
M_d1 = [1 d2 0 0; 0 1 0 0; 0 0 1 d2; 0 0 0 1];

point1Prime = zeros(4, 1);
point2Prime = zeros(4, 1);
point3Prime = zeros(4, 1);
for c = 1:count1-1
    point1Prime(:, c) = M_d1*remainingRays1(:, c);
end
for c = 1:count2-1
    point2Prime(:, c) = M_d1*remainingRays2(:, c);
end
for c = 1:count3-1
    point3Prime(:, c) = M_d1*remainingRays3(:, c);
end

ray_z1 = [d1*ones(1,size(remainingRays1,2)); (d2+d1)*ones(1,size(remainingRays1,2))];
ray_z2 = [d1*ones(1,size(remainingRays2,2)); (d2+d1)*ones(1,size(remainingRays2,2))];
ray_z3 = [d1*ones(1,size(remainingRays3,2)); (d2+d1)*ones(1,size(remainingRays3,2))];

plot(ray_z1, [remainingRays1(1,:); point1Prime(1,:)], "Color", "r");
plot(ray_z2, [remainingRays2(1,:); point2Prime(1,:)], "Color", "b");
plot(ray_z3, [remainingRays3(1,:); point3Prime(1,:)], "Color", "g");

