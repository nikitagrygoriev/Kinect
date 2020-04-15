function IColor = processRgb(rgb)
IColor =rgb;
IGray = rgb2gray(IColor); %color to rgb

BW = im2bw(IGray,0.77); %binarization

se = strel('disk',50);
afterOpening = imopen(BW,se); %open

ImageFilled = imfill(afterOpening,'holes'); % filling holes

FINAL = ImageFilled-afterOpening; 
[x,y,z] = size(IColor);

for i = 1:x
    for j = 1:y
        if(FINAL(i,j) == 0)
            IColor(i,j,:) = [255,255,255];
        end
    end
end
end

