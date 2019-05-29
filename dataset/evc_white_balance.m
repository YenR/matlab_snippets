function [result] = evc_white_balance(input, white)
%EVC_WHITE_BALANCE Führt den manuellen Weißabgleich durch.
%
%   EINGABE
%   input ... Bild
%   white ... ein RGB Vektor mit der Farbe, die weiß werden soll
%   AUSGABE
%   result... Ergebnis nach dem Weißabgleich

    %NOTE: Die folgende Zeile kann gelöscht werden. Sie verhindert, dass
    %die Funktion, solange sie nicht implementiert wurde, abstürzt.
    
    input(:,:,1) = input(:,:,1) .* (1 / white(1));
    input(:,:,2) = input(:,:,2) .* (1 / white(2));
    input(:,:,3) = input(:,:,3) .* (1 / white(3));
    result = input;
    
    %TODO: Berechne den Weißabgleich mit dem white Wert
    
    %NOTE: Hellere Bildpunkte als dieser, werden anschließend Werte > 1 haben.    
    %Die dadurch benötigte Normalisierung wird am Ende bei der Kontraststärkung
    %gemacht.
end