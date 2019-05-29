function [ result ] = evc_DoF( input, depth, focus )
%EVC_DOF Berechnet einen 'Depth of Field'-Effekt basierend auf dem
%Inputbild und dem zugeh�rigen Tiefenbild.
%   input ... das Inputbild (double-Format; Werte f�r Rot, Gr�n und Blau
%             liegen zwischen 0 und 1)
%   depth ... das Inputbild (double-Format; Pixel, die nahe der Kamera
%             liegen, haben kleinere Werte als Pixel, die weiter entfernt
%             sind; Werte liegen zwischen 0 und 1)
%   focus ... Fokusdistanz in der das Bild 'scharf' erscheinen soll

    % TODO: Diese Zeile kann gel�scht werden. Sie verhindert nur, dass die
    % Funktion nicht abst�rzt, solange sie nicht implementiert wurde.
    result = input;

    % TODO 1: Berechne ein gegl�ttetes Bild mit zwei 1D Gau�filtern, wie
    % in der Angabe beschrieben.
    
    f1 = fspecial('gaussian', [59, 1], 10);
    f2 = fspecial('gaussian', [1, 59], 10);
    
    result = imfilter(result, f1);
    result = imfilter(result, f2);
    
    % TODO 2: Bestimme die 'Fokusfunktion', wie in der Angabe beschrieben.
    
    %function [ focus ] = f( depth, focus )
    %    focus = abs(depth - focus) * (1/max(focus, 1-focus));
    %end

    f = abs(depth - focus) .* (1/max(focus, 1-focus));

    % TODO 3: Interpoliere linear zwischen Original- und gegl�ttetem Bild
    % mit der 'Fokusfunktion'. Wenn die 'Fokusfunktion' gleich 0 ist, wird
    % zu 100% das Originalbild verwendet. Ist die 'Fokusfunktion' 1, wird
    % zu 100% das gegl�ttete Bild verwendet.
    
    f = repmat(f, [1 1 3]);
    result = (1-f) .* input + f .* result;

    % Der 'Depth of Field'-Effekt soll in 'result' zur�ckgegeben werden.
end
