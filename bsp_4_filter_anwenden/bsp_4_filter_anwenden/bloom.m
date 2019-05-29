function [ result ] = bloom( input, th )
%EVC_BLOOM Berechnet einen Bloom-Effekt basierend auf dem Inputbild.

    grey = rgb2gray(input);
    B = im2bw(grey, th);

    result = input .* cat(3, B, B, B);

    result = imfilter(result, fspecial('gaussian', [1, 59], 9));
    result = imfilter(result, fspecial('gaussian', [59, 1], 9));
end

