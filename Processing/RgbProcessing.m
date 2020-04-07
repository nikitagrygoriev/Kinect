function [depthImage] = RgbProcessing(pngImagePath, depthImage)
img = imread(pngImagePath);

img_binary = im2bw(img,0.8); % binaryzacja

img_binary_filled = imfill(img_binary,'holes'); % wype?nianie

se = strel('rectangle',[40,50]);
openImg = imopen(im2uint8(img_binary_filled),se); % otwarcie
enhenImg=imadjust(openImg);
BinImg = im2bw(enhenImg,graythresh(enhenImg));

% próba na?o?enia rgb na depth image (do ulepszenia)
BinImg = BinImg(:,308:1612);
BinImg = imresize(BinImg, [424,512]);

M = median(depthImage,'all'); % najwieksza odleglosc od kinecta - zakladam ze kartka 
MIN = min(depthImage, [], 'all'); % najmniejsza odleglosc od kinecta - zakladam ze kartka 

for i = 1:424
    for j = 1:512
        if BinImg(i,j) == 0
            depthImage(i,j) = M; %jesli piksel nie znajduje sie na kartce to ustawiamy wartosc jako M
        end
    end
end



end

