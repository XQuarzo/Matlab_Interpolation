%
% Elaborazione di calcoli matriciali a scopo didattico.
% Per permettere una chiara interpretazione gli algoritmi non sono stati volutamente ottimizzati.
%
% Ideatore e sviluppatore: Antonio Lisotti
%

dD = 50;

YMin = 0;
YMax = 450;

nStep = 450;
YStep = (YMax - YMin)/nStep;
Yd = YMin:dD:YMax;
Y = YMin+1:YStep:YMax;

M_Yint = zeros(length(H), nStep);

for i=1:length(H)
    M_Yint(i, :) = interp1(Yd, M_Vint(i, :), Y, "linear");
end

figure(6)
colormap(hsv);
axis square;
imagesc(M_Yint);
h = colorbar;
set( h, 'YDir', 'reverse' );
