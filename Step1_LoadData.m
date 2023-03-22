%
% Elaborazione di calcoli matriciali a scopo didattico.
% Per permettere una chiara interpretazione gli algoritmi non sono stati volutamente ottimizzati.
%
% Ideatore e sviluppatore: Antonio Lisotti
%

% Load Data in memory

FilesNameRoot = "Depth_Vel_CDP";
NumberOfFiles = 10;

C = cell(1, NumberOfFiles);

VMin = inf;
VMax = -inf;
HMin = inf;
HMax = -inf;
k=1;
for i=1:NumberOfFiles
    C(1,i) = {readmatrix(FilesNameRoot + i + ".xlsx")};
    
    VMin_i = min(C{1,i}(:,2));
    if VMin_i < VMin
        VMin = VMin_i;
    end
    VMax_i = max(C{1,i}(:,2));
    if VMax_i > VMax
        VMax = VMax_i;
    end

    HMin_i = min(C{1,i}(:,1));
    if HMin_i < HMin
        HMin = HMin_i;
    end
    HMax_i = max(C{1,i}(:,1));
    if HMax_i > HMax
        HMax = HMax_i;
    end
end

sizC = size(C);