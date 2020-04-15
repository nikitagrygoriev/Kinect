function [cropped_point_cloud, cropped_rgb] = procesData(rgbPath, depthPath)
A = dlmread(rgbPath);
m = uint8(reshape(A, 1080,1920,3));
processed_RGB = processRgb(m);

B = dlmread(depthPath);
m2 = uint16(reshape(B, 424, 512));
[processed_depthImage,zeroPixels] = Kinect_DepthNormalization(m2);

ptCloud = pcfromkinect(depthDevice, processed_depthImage, processed_RGB);

cropped_point_cloud = ptCloud.Location(300:800,750:1250,:);
cropped_rgb = ptCloud.Color(300:800,750:1250,:);
end
