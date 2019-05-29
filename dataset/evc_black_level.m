function [result asShotNeutral] = evc_black_level(input, filename)
%EVC_BLACK_LEVEL Stellt den Schwarzwert ein und konvertiert das Bild ins
%   double Format mit Werten [0.0, 1.0]. Zusätzliche Infos über das Bild
%   können mit dem Befehl imfinfo abgerufen werden.
%
%   EINGABE
%   input   ... Eingelesenes Bild
%   filename... Dateiname des Bildes (für imfinfo)
%   AUSGABE
%   result  ... das Bild im double Format, wobei das Interval
%           [Schwarzwert,65535] auf [0,1] abgebildet wurde und alle Werte
%           kleiner oder gleich dem Schwarzwert 0 sind
%   asShotNeutral... neutraler Weißabgleich, welcher in den Bildinformationen
%           gespeichert ist (siehe imfinfo)


    %NOTE: Die folgenden zwei Zeilen können gelöscht werden. Sie
    %verhindern, dass die Funktion, solange sie nicht implementiert wurde,
    %abstürzt.
    
    INFO = imfinfo(filename);
    asShotNeutral = INFO.AsShotNeutral;
    
    result = double(input - INFO.BlackLevel) ./ (INFO.MaxSampleValue - INFO.BlackLevel);
    result(result<0) = 0;
    
    %TODO Bestimme den Schwarzwert (BlackLevel) und den neutralen
    %     Weißabgleich (AsShotNeutral) anhand der Bildinformationen
    %     (siehe Matlab-Hilfe zur Funktion imfinfo).
    
    %TODO Verschiebe und skaliere den Kontrast so, dass Schwarz auf 0 und
    %     Weiß auf 1 abgebildet wird. Die Bilder in deinem Datensatz haben
    %     alle den Weißwert auf 65535 gesetzt.
end

