sizC = size(C);

VMin = min(M_In(:, 3));
VMax = max(M_In(:, 3));
nStep = 99;
maxLimit = 0;
VStep = (VMax - VMin)/nStep;
V = VMin:VStep:(VMax - maxLimit);

M_Hint = zeros(length(V), sizC(2));

for i=1:sizC(2)
    %                       Velocity     Depth       V = QueryPoints   
    M_Hint(:, i) = interp1(C{1,i}(:,2), C{1,i}(:,1), V, "linear");   
end

figure(1)
set(gca, 'YDir','reverse');
xlabel("Velocity (m/s)");
ylabel("Depth (m)")
hold on
for i=1:sizC(2)    
    plot(V, M_Hint(:, i), '-.');
end
hold off