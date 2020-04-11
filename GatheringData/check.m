A = readmatrix('BananaColor_2.txt');

m = uint8(reshape(A, 1080,1920,3));

B = readmatrix('BananaDepth_2.txt');

m2 = uint16(reshape(B, 424, 512));

figure(1);
ptCloud = pcfromkinect(depthDevice, m2, m);
% pcshow(ptCloud)

x = ptCloud.Location(290:789,710:1209,1);
y = ptCloud.Location(290:789,710:1209,2);
z = ptCloud.Location(290:789,710:1209,3);

figure(2);
hold on
mesh(x,y,z);
hold off

% mesh(m)
