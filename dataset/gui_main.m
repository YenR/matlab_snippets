function[] = gui_main(filename)
%EVC_MAIN Die Hauptfunktion. Nicht abgeben! 
%Änderungen der Signaturen jeglicher Funktionen ist verboten (Name, Eingabe, Ausgabe).
    close all;
    clear global;
    CFA = imread(filename); %Einlesen der Bilddatei

    [CFA asShotNeutral] = evc_black_level(CFA, filename); %Schwarz ausgleichen
      
    bins = 512; %Anzahl der Bündel im Histogramm
    
    RGB = evc_demosaic(CFA, asShotNeutral); %Farben nachrechnen	
    clear CFA; %wird nicht mehr gebraucht

	RGB_WB = gui_white_balance(RGB); %Weißabgleich
    RGB_GAMMA = gui_gamma_correction(RGB_WB, bins); %Gammakorrektur
    RGB_RESULT = gui_histogram_clipping(RGB_GAMMA, bins); %Kontrasterhöhung

    %optional - Bild nochmal zeigen
    imshow(RGB_RESULT, []);
    %optional - Bild speichern
    %imwrite(uint8(RGB_RESULT * 255), 'output.png', 'png');
end