function [cropped_PointCloud, cropped_rgb] = processFruit(fruitName, number)
mainFolder = "../Data/TestData/" + fruitName + "/";
rgb = mainFolder + fruitName + "Color_"+ number + ".txt";
depth = mainFolder + fruitName + "Depth_"+ number + ".txt";

[cropped_PointCloud, cropped_rgb] = procesData(rgb,depth)

destinationFolder = "../Data/ProcessedData/" + fruitName + "/";

cropped_PointCloud_path = destinationFolder + fruitName + "Color_cropped_"+ number + ".mat"; %  ?? nie wiem jaki format
cropped_rgb_path =  destinationFolder + fruitName + "Depth_cropped_"+ number + ".png";


imwrite(cropped_rgb,cropped_rgb_path);
save(cropped_PointCloud,cropped_PointCloud_path);

end
