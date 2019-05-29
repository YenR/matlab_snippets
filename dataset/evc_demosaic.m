function [result] = evc_demosaic(input, neutral)
%EVC_DEMOSAIC Extrahiert aus dem Bayer-Pattern-Bild ein Farbbild.
%   Dazu soll vorher ein neutraler Weißabgleich vorgenommen werden.
%   Anschließend sollen die fehlenden Werte durch lineare Interpolation 
%   berechnet werden (siehe Angabe!). Die Kernel der Interpolationsfilter 
%   müssen selbst geschrieben werden.
%
%   EINGABE
%   input  ... Bild
%   neutral... der neutrale Weißabgleich
%   AUSGABE
%   result ... RGB Bild

    %NOTE: Die folgende Zeile kann gelöscht werden. Sie verhindert, dass
    %die Funktion, solange sie nicht implementiert wurde, abstürzt.
    
    %TODO Erzeuge Matrizen für R, G und B.
    %     Fülle sie mit Werten aus input (Bayer-Pattern-Bild). Dazu eignet sich
    %     gut die "start:skip:end" Selektion.
    %     Wende den neutralen Weißabgelich an.
    
    R = zeros(size(input));
    G = zeros(size(input));
    B = zeros(size(input));
    
    %RGGB
    %R(1:2:end, 1:2:end) = input(1:2:end, 1:2:end) / neutral(1); % 1...red
    %G(1:2:end, 2:2:end) = input(1:2:end, 2:2:end) / neutral(2); 
    %G(2:2:end, 1:2:end) = input(2:2:end, 1:2:end) / neutral(2); 
    %B(2:2:end, 2:2:end) = input(2:2:end, 2:2:end) / neutral(3); 
    
    %BGGR
    R(2:2:end, 2:2:end) = input(2:2:end, 2:2:end) / neutral(1); % 1...red
    G(1:2:end, 2:2:end) = input(1:2:end, 2:2:end) / neutral(2); 
    G(2:2:end, 1:2:end) = input(2:2:end, 1:2:end) / neutral(2); 
    B(1:2:end, 1:2:end) = input(1:2:end, 1:2:end) / neutral(3); 
    
    R = imfilter(R, [0.25, 0.5, 0.25; 0.5, 1, 0.5; 0.25, 0.5, 0.25]);
    G = imfilter(G, [0, 0.25, 0; 0.25, 1, 0.25; 0, 0.25, 0]);
    B = imfilter(B, [0.25, 0.5, 0.25; 0.5, 1, 0.5; 0.25, 0.5, 0.25]);
    
    %TODO Interpoliere die fehlenden Farbwerte, wie in der Angabe beschrieben.
    
    result = cat(3, R, G, B);
    %TODO Verbinde R, B, G zu einer Matrix und gib sie über 'result'
    %     zurück.
end