%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bilder laden
I = im2double(imread('c.png'));
D = im2double(imread('d.png'));
D = 1-D(:,:,1);
one = ones(size(I,1), size(I,2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Licht Einstellungen
ks = 1.0;
kd = 0.8;
ka = 0.2;
is = [1,0.95,0.93];
id = [1,0.95,0.98];
ia = [0.98,0.95,1];
ia = cat(3, one*ia(1), one*ia(2), one*ia(3));
id = cat(3, one*id(1), one*id(2), one*id(3));
is = cat(3, one*is(1), one*is(2), one*is(3));
alpha = 32;
L = [-0.5 1 1];
L = L / norm(L);
L = cat(3,one*L(1),one*L(2),one*L(3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Camera Einstellungen
f = 30;
n = 5;
fov = 49.1 * pi / 180;
half = tan(fov)/2;
x = -half:(2*half)/(size(D,2)-1):half;
half = -tan(fov * size(D,1) / size(I,2))/2;
y = (-half:(2*half)/(size(D,1)-1):half)';
V = cat(3, repmat(x, size(D,1), 1), repmat(y, 1, size(D,2)), -ones(size(D)));
VdotV = V .* V;
VdotV = sqrt(VdotV(:,:,1)+VdotV(:,:,2)+VdotV(:,:,3));
V = V ./ cat(3, VdotV, VdotV, VdotV);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Berechnung der Tiefe
Z = evc_compute_depth(D, n, f);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Normalmap berechnen
N = evc_compute_normals(Z, V);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Blinn-Phong Shading
H = evc_blinn_phong(-V,L,N,ia,id,is,ka,kd,ks,alpha);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig = figure('name','EVC Beispiel 5');
set(fig, 'OuterPosition', [50 40 1200 750]);
set(fig, 'Units', 'pixels');
%get display size
screenSize = get(0, 'ScreenSize');
%calculate the center of the display
position = get(fig, 'Position');
position(1) = (screenSize(3)-position(3))/2;
position(2) = (screenSize(4)-position(4))/2;
%center the window
set(fig, 'Position', position);
subaxis(2,2,1, 'Spacing', 0.01, 'Padding', 0, 'Margin', 0);
imshow(I);
subaxis(2,2,2, 'Spacing', 0.01, 'Padding', 0, 'Margin', 0);
imshow(I .* H);
subaxis(2,3,4, 'Spacing', 0.01, 'Padding', 0, 'Margin', 0);
imshow(D);
title('Input: Depth Buffer');
subaxis(2,3,5, 'Spacing', 0.01, 'Padding', 0, 'Margin', 0);
imshow(N * 0.5 + 0.5);
title('Output: Normalmap * 0.5 + 0.5');
subaxis(2,3,6, 'Spacing', 0.01, 'Padding', 0, 'Margin', 0);
imshow(H);
title('Output: Blinn-Phong Shading');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%imwrite(I .* H, 'img/bsp_4_final.png', 'png');
