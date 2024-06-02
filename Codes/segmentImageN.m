function [BW,maskedImage] = segmentImageN(X)

% Threshold image - global threshold
BW = imbinarize(X);

% Invert mask
BW = imcomplement(BW);

% Close mask with disk
radius = 12;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imclose(BW, se);

% Fill holes
BW = imfill(BW, 'holes');

% Create masked image.
maskedImage = X;
maskedImage(~BW) = 0;
end

