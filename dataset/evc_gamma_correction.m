function [result] = evc_gamma_correction(input, gamma, saturate)
%EVC_GAMMA_CORRECTION Wendet Gammakorrektur pro Farbkanal oder Helligkeit an
%   EINGABE
%   input   ... Bild
%   gamma   ... Gamma Wert
%   saturate... Falls 1: Die Farbanteile sollen erhalten bleiben.
%               Sonst: Die Intensitätswerte sollen direkt hoch Gamma exponiert werden.
%   AUSGABE
%   result  ... Bild nach der Gammakorrektur

    %NOTE: Die folgende Zeile kann gelöscht werden. Sie verhindert, dass
    %die Funktion, solange sie nicht implementiert wurde, abstürzt.
    
    %TODO Gamma^(-1) berechnen und auf Division durch 0 achten.
    if gamma < 0.0000000001
        gamma = 0.0000000001;
    end
    gamma = 1/gamma;
    
    if (saturate)
        m = max(input(:));
        brightness = rgb2gray(input .* (1/ m)) .* m;
        chromacity = input ./ repmat(brightness, [1 1 3]);
        brightness = brightness .^ gamma;
        input = repmat(brightness, [1 1 3]) .* chromacity;
        %TODO Berechne die Helligkeiten der Bildpunkte.
        %     Achtung, rgb2gray normalisiert das Bild. Das Ausmaß der 
        %     Intensitäten soll aber erhalten bleiben!
        %     Berechne die Farbanteile und erhalte sie,
        %     nachdem die Gammakorrektur angewandt wurde.
    else
        input = input .^ gamma;
        %TODO Alle Intensitätswerte müssen mit gamma^-1 potenziert werden    
    end
    result = input;
end