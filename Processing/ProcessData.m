function depthImage = ProcessData(depthImagePath, PngImagePath)
close all;

depthImage = prepareDepthImage(depthImagePath);
[depthImage,zeroPixels] = Kinect_DepthNormalization(depthImage);
depthImage = RgbProcessing(PngImagePath, depthImage);

%figure;
%mesh(depthImage)

depthToImage = uint8(255 * mat2gray(depthImage));
figure;
imshow(depthToImage)

depthImage = depthImage(100:300,175:375);
figure;
mesh(depthImage)

depthToImage = uint8(255 * mat2gray(depthImage));
figure;
imshow(depthToImage)

% dodatkowo

MIN = min(depthImage, [], 'all'); % najmniejsza odleglosc od kinecta - np. czubek pomaranczy
[x,y] = size(depthImage);
for i = 1:x
    for j = 1:y
        depthImage(i,j) = depthImage(i,j) - MIN;
    end
end

end
