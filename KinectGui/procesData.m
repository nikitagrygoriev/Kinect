function [vals] = procesData(rgb, depth, depthDevice)
processed_RGB = processRgb(rgb);
[processed_depthImage,zeroPixels] = Kinect_DepthNormalization(depth);

ptCloud = pcfromkinect(depthDevice, processed_depthImage, processed_RGB);

cropped_xyz = ptCloud.Location(290:789,710:1209,:);
cropped_rgb = ptCloud.Color(290:789,710:1209,:);
vals = cat(3,cropped_xyz,single(cropped_rgb));

end
