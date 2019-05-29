color = im2double(imread('color.png'));
depth = im2double(imread('depth.png'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aufbereiten der Tiefenwerte, damit unser einfacher
% 'Depth of Field'-Effekt besser aussieht.
depth = min(depth(:,:,1) * 2, 1);
depth = imfilter(depth, fspecial('average', [39 1]));
depth = imfilter(depth, fspecial('average', [1 39]));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Standardwerte festlegen
colorkey = [0.038 0.619 1.000];
th_bloom = 0.85;
th_flare = 0.20;
focus = 0.25;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bloom-Effekt
Bloom = bloom(color, th_bloom);
% Flare-Effekt
Flare = evc_flare(color, colorkey, th_flare);
% 'Depth of Field'-Effekt
DoF = evc_DoF(color, depth, focus);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig = figure('name','EVC Beispiel 4');
set(fig, 'OuterPosition', [50 40 800 900]);
subaxis(2,1,1, 'Spacing', 0.01, 'Padding', 0, 'Margin', 0);
imshow(color);
subaxis(2,1,2, 'Spacing', 0.01, 'Padding', 0, 'Margin', 0);
I = DoF + Bloom + Flare;
imshow(I);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

