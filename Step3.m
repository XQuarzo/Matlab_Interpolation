dD = 50;

YMin = min(M_In(:, 2));
YMax = max(M_In(:, 2));
nStep = 128;
YStep = (YMax - YMin)/nStep;
Yd = YMin:dD:YMax;
Y = YMin:YStep:YMax;

M_Yint = zeros(length(V), nStep+1);

for i=1:length(V)
    M_Yint(i, :) = interp1(Yd, M_Hint(i, :), Y, "linear");
end

M_YAint = zeros(length(V), nStep+1);

for i=1:length(V) - 24
    M_YAint(i, :) = interp1(Yd, M_Hint(i, :), Y, "makima");
end

figure(5)
set(gca, 'YDir','reverse');

hold on
for i=1:length(V)
    plot(Y, M_Yint(i, :), ':.');
end
hold off

figure(6)
imagesc(M_Yint);

figure(7)
imagesc(M_YAint);

M_Int = interp2(M_YAint, 3);

figure(8)
imagesc(M_Int)