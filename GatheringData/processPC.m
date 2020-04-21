function processedPC = processPC(PC)
    xyz = PC.Location;
    s = size(PC.Color);
    for i = 1:s(1)
        for j = 1:s(2)
            if PC.Color(i,j,1) == 255 & PC.Color(i,j,2) == 255 & PC.Color(i,j,3) == 255
                xyz(i,j,:) = nan('single');
            end
        end
    end

    processedPC = removeInvalidPoints(pointCloud(xyz,'Color',PC.Color));

end