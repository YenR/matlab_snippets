function [ result ] = evc_blinn_phong( V, L, N, ia, id, is, ka, kd, ks, alpha )
%EVC_BLINN_PHONG Blinn-Phong-Beleuchtungsmodell (siehe Skriptum).
%   V  ... Matrix von normalisierten 3D-Vektoren die in Richtung der Kamera zeigen
%   L  ... Matrix von normalisierten 3D-Vektoren die in Richtung der Lichtquelle zeigen
%   N  ... Matrix der normalisierten Normalen des Bildes
%   ia ... Farbe der ambienten Beleuchtung (als Matrix/Bild)
%   id ... Farbe der diffusen Beleuchtung (als Matrix/Bild)
%   is ... Farbe der Glanzpunkte (specular Beleuchtung als Matrix/Bild)
%   ka ... Konstante für ambiente Beleuchtung
%   kd ... Konstante für diffuse Beleuchtung
%   ks ... Konstante für Glanzpunkte (specular Beleuchtung)
%   alpha. Glanzkonstante
    
    % NOTE: Diese Zeile kann gelöscht werden. Sie verhindert, dass
    %       die Funktion abstürzt, solange sie nicht implementiert wurde.
    result = ones(size(V));

    % TODO: Berechne anhand der Inputparameter das Blinn-Phong-
    %       Beleuchtungsmodell (Shading-Modell). Man muss dabei bedenken,
    %       dass es beim diffusen Term das Skalarprodukt (dot product) von
    %       L und N (also L dot N) auch kleiner 0 sein kann. Daher muss man
    %       nach der Berechnung von L dot N auch noch sicherstellen, dass
    %       das Ergebnis des Skalarprodukts größer gleich 0 ist. Das
    %       gleiche macht man auch für den specular Term mit dem
    %       Skalarprodukt N dot H.
        
    LdotN = dot(L, N, 3);
    LdotN(LdotN < 0) = 0;
    
    dif = (id * kd) .* cat(3, LdotN, LdotN, LdotN);
    
    H = L + V;
    h2 = sqrt(H(:,:,1).^2 + H(:,:,2).^2 + H(:,:,3).^2);
    H = H ./ cat(3, h2, h2, h2);
    
    NdotH = dot(N, H, 3);
    NdotH(NdotH < 0) = 0;
    
    spec = (is * ks) .* cat(3, NdotH.^alpha, NdotH.^alpha, NdotH.^alpha);
    
    result = (ia * ka) + dif + spec;
    
end

