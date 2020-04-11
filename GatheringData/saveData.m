release(colorDevice);
release(depthDevice);

colorDevice = imaq.VideoDevice('kinect',1);
depthDevice = imaq.VideoDevice('kinect',2);

colorDevice();
depthDevice();
colorFile = 'AppleColor';
depthFile = 'AppleDepth';
for i = 9:9
    fprintf('Image nr %d.\n',i);
	colorImage = colorDevice();
	depthImage = depthDevice();
	fprintf('Done %d.\n',i);
    
	fileID = fopen(sprintf('%s_%d.txt',colorFile,i),'w');
    fprintf(fileID,'%d\n',colorImage);
    fclose(fileID);
    
    fileID2 = fopen(sprintf('%s_%d.txt',depthFile,i),'w');
    fprintf(fileID2,'%d\n',depthImage);
    fclose(fileID2);
    
%     pause(2);
end

release(colorDevice);
release(depthDevice);