%
% Elaborazione di calcoli matriciali a scopo didattico.
% Per permettere una chiara interpretazione gli algoritmi non sono stati volutamente ottimizzati.
%
% Ideatore e sviluppatore: Antonio Lisotti
%

H = HMin:1:HMax;

NnNanA_Min = zeros(sizC(2), 1);
NnNanA_Max = zeros(sizC(2), 1);
M_Vint = zeros(length(H), sizC(2));

for i=1:sizC(2)
    %                       Depth        Velocity     H = QueryPoints   
    M_Vint(:, i) = interp1(C{1,i}(:,1), C{1,i}(:,2),  H, "linear");   
    k = 0;
    while (k<length(H))
        k = k + 1;
        if not(isnan(M_Vint(k, i)))
            break
        end
    end
    NnNanA_Min(i)=k;
   
    while (k<length(H))
        k = k + 1;
        if isnan(M_Vint(k, i))
            break
        end
    end
    NnNanA_Max(i)=k;
end
NnNanMin = max(NnNanA_Min);
NnNanMax = min(NnNanA_Max) - 1;

figure(1)
set(gca, 'YDir','reverse');
xlabel("Velocity (m/s)");
ylabel("Depth (m)")
hold on
for i=1:sizC(2)    
    plot(M_Vint(:, i), H, '.');
end
hold off

figure(2)
colormap(hsv);
axis square;
imagesc(M_Vint);
colorbar;