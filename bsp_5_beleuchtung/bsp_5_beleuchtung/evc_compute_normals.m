function [ result ] = evc_compute_normals( Z, V )
%EVC_COMPUTE_NORMALS Berechnet eine Normalmap anhand der "echten"
%Tiefenwerte.
%   Z ... Tiefenwerte im Viewing-Koordinatensystem (Werte zwischen near und
%         far plane). Dies ist das Resultat aus evc_compute_depth.
%   V ... normalisierte Blickrichtung in Richtung des Pixels
    
    % NOTE: Diese Zeilen können gelöscht werden. Sie verhindern, dass
    %       die Funktion abstürzt, solange sie nicht implementiert wurde.
    %result = zeros(size(Z));
    %result = cat(3,result,result,ones(size(Z)));

    % TODO: Zuerst müssen die Pixel in den View-Space projiziert werden.
    %       Dies erreicht man, indem man die Blickrichtung mit den
    %       Tiefenwerten multipliziert. Man erhält ein Bild D in dem jedes
    %       Pixel die Position im View-Space angibt. Um die X- und
    %       Y-Tangenten zu erhalten, benötigt man die ersten Ableitungen dX
    %       und dY des Bildes D in X- und Y-Richtung (siehe Kapitel 03 der
    %       Übungseinführung "Transformationen und Filter"). Berechnet man
    %       nun das Kreuzprodukt der Ableitungen (Tangenten) erhält man die
    %       Normalen jedes Pixels. Diese müssen noch normalisiert werden,
    %       um eine Normalmap zu erhalten, die über "result" zurückgegeben
    %       werden soll.
    
    %D = repmat(Z, [1 1 3]);
    %D(:,:,1) = Z .* V(1);
    %D(:,:,2) = Z .* V(2);
    %D(:,:,3) = Z .* V(3);
     
    D = cat(3, Z, Z, Z);
    D = D .* V;
    
    dX = imfilter(D, [-1 1]);
    dY = imfilter(D, [1; -1]);
      
    result = cross(dX, dY, 3);
    
    r2 = sqrt(result(:,:,1).^2 + result(:,:,2).^2 + result(:,:,3).^2);
    result = result ./ cat(3, r2, r2, r2);
        
    %rsize = size(result);
    %for x=1:rsize(1)
    %   for y=1:rsize(2)
    %      l = sqrt( result(x, y, 1)^2 + result(x, y, 2)^2 + result(x, y, 3)^2);
    %      result(x,y,:) = result(x,y,:) ./ l;
    %   end
    %end
        
    
end

