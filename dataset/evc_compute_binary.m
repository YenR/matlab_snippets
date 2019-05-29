function [result] = evc_compute_binary(input, x, top)
%EVC_COMPUTE_BINARY Berechnet ein bin�res Bild anhand des �bergebenen
%Schwellwertes (x).
%
%   EINGABE
%   input ... Bild
%   x     ... Schwellwert
%   top   ... Falls 0, soll ein Inversionsbild generiert werden. Also 0
%             soll 1 und 1 soll 0 werden.
%   AUSGABE
%   result... Bin�res Bild, dass nur 0.0 oder 1.0 enthalten darf. Achtung
%             das Ergebnis muss vom Type double sein!

    %NOTE: Die folgende Zeile kann gel�scht werden. Sie verhindert, dass
    %die Funktion, solange sie nicht implementiert wurde, abst�rzt.
    result = input>x;
    if top == 0
        result = ~result;
    end
    result = double(result);
    %TODO: Erzeuge ein Bin�rbild von input anhand des gegebenen
    %Schwellwertes x. Da im Eingabebild auch Intensit�ten �ber 1 vorkommen,
    %kann die Funktion im2bw nicht verwendet werden (sie wird abst�rzen).
    %Falls top == 0, soll ein Inversionsbild generiert werden (0 und 1
    %m�ssen vertauscht werden).
end
