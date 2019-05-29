function [ result ] = evc_compute_depth( Z, near, far )
%EVC_COMPUTE_DEPTH Wandelt die Tiefenwerte die im Intervall [0;1] liegen,
%in "echte" Tiefenwerte um [-far;-near].
%   Z    ... Tiefenwerte (Werte liegen zwischen 0 und 1)
%   near ... Die Distanz der Near-Plane der Kameraprojektion
%   far  ... Die Distanz der Far-Plane der Kameraprojektion

    % NOTE: Diese Zeile kann gelöscht werden. Sie verhindert, dass
    %       die Funktion abstürzt, solange sie nicht implementiert wurde.
    
    % TODO: Wandle die Tiefenwerte des Depth-Buffers (Z) in "echte" Tiefe
    %       mit Hilfe von "near" und "far" um. Dies entspricht der
    %       Abbildung des Intervalls [0;1] auf das Interval [-far;-near],
    %       wobei Werte gleich 0 auf -near und Werte gleich 1 auf -far
    %       abgebildet werden.
    
    result = ((Z .* (far - near)) + near ) .* -1;
end

