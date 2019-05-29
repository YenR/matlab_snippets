function [ result ] = evc_flare( input, colorkey, th )
%EVC_FLARE Berechnet einen Flare-Effekt basierend auf dem Inputbild.
%   input ... das Inputbild (double-Format; Werte f�r Rot, Gr�n und Blau
%             liegen zwischen 0 und 1)
%   th ... threshold f�r das zu erstellende Bin�rbild (float-Wert)
%   colorkey ... "Farbschl�ssel", alle Pixel die dieser Farbe �hneln,
%   sollen selektiert werden (RGB Vektor)

    % TODO: Diese Zeile kann gel�scht werden. Sie verhindert nur, dass die
    % Funktion nicht abst�rzt, solange sie nicht implementiert wurde.
    
    %result = zeros(size(input));
    
    % TODO 1: Berechne die Differenz zwischen Schl�sselfarbe 'colorkey' und
    % Inputbild und erstelle ein Bin�rbild mit dem Schwellwert 'th'. Im
    % resultierenden Bild sollen in jedem Farbkanal alle Pixel, die
    % UNTER diesem Schwellwert liegen Wei� sein. Berechne aus den
    % Bin�rbildern der Farbkan�le ein weiteres Bin�rbild, in welchem all
    % jene Pixel 1 sind, die auch im Rot-, Gr�n- und Blaukanal den Wert 1
    % haben.
    
    result = input;
    
    result(:, :, 1) = abs(result(:, :, 1) - colorkey(1));
    result(:, :, 2) = abs(result(:, :, 2) - colorkey(2));
    result(:, :, 3) = abs(result(:, :, 3) - colorkey(3));
    
    result = result < th;
    binary = result(:, :, 1) & result(:, :, 2) & result(:, :, 3);
    
    % TODO 2: Isoliere mit dem im TODO 1 berechneten Bin�rbild jene Pixel
    % im Originalbild, auf welche der 'Flarefilter' angewendet werden soll.
    
    result = input;
    
    result(:, :, 1) = result(:, :, 1) + binary - 1;
    result(:, :, 2) = result(:, :, 2) + binary - 1;
    result(:, :, 3) = result(:, :, 3) + binary - 1;
    
    result(result < 0) = 0;

    % TODO 3: Erstelle mit der Matlab-Funktion 'fspecial' zwei 1D
    % Gau�filter, multipliziere diese mit 4, und wende diese, wie in der
    % Angabe beschrieben, auf das in TODO 2 erstellte Bild an.
    
    f1 = fspecial('gaussian', [29, 1], 5);
    f2 = fspecial('gaussian', [1, 239], 40);
    
    result = imfilter(result, f1 * 4);
    result = imfilter(result, f2 * 4);
    
    % TODO 4: Um den Flare-Effekt 'leuchten' zu lassen, wird zuerst an jenen
    % Stellen, an denen der Wert eines Farbkanals �ber 1.0 liegt (I > 1.0),
    % die H�lfte des �berschusses ermittelt. Dieser Wert wird f�r die 
    % jeweils anderen beiden Kan�le in einer Hilfsmatrix
    % abgespeichert. (Dieser Vorgang wird f�r alle drei Farbkan�le 
    % ausgef�hrt.) Die Hilfsmatrix wird dann zum Inputbild addiert.
    % Werte, die nach dieser "Umverteilung" noch immer > 1 sind, werden 
    % auf 1 gesetzt.
    
    help = result - 1;
    help(help<0) = 0;
    
    result(result>1) = 1;
    result(:, :, 1) = result(:, :, 1) + help(:, :, 2)/2 + help(:, :, 3)/2;
    result(:, :, 2) = result(:, :, 2) + help(:, :, 1)/2 + help(:, :, 3)/2;
    result(:, :, 3) = result(:, :, 3) + help(:, :, 1)/2 + help(:, :, 2)/2;
    result(result>1) = 1;
    
    % Der Flare-Effekt soll in 'result' zur�ckgegeben werden.
end

