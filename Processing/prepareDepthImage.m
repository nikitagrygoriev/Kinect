function depthImage = prepareDepthImage(fileText)
A = dlmread(fileText);

depthImage = reshape(A, 512,424);
depthImage = transpose(depthImage);
depthImage = uint16(depthImage);
end

