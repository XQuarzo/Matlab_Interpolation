% Load Data

M_In=zeros(100,3);
C=cell(1, 10);

dD = 50;
k=1;
for i=1:10
    s = "Depth_Vel_CDP" + i;
    V = readmatrix(s);
    C(1,i)={V};
    for j=1:length(V)
        M_In(k,1) = V(j,1);
        M_In(k,2) = dD*(i-1);
        M_In(k,3) = V(j,2);
        k = k + 1;
    end
end

M_In = M_In(1:k-1,:);