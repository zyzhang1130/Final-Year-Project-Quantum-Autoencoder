addpath(genpath('./QETLAB-0.9'))
global iii flipmode
netfidave=[];
netfidstd=[];
datafidave=[];

for iii=1:99
    iii
    m = 2;
    M = [m,1,m];
    flipmode =3;
    
    n = 500;
    iter = 100;
    mode = 1;
    lambda = 0.8; %0.5
    dim = 2^m;
    if mode == 1
        path = 'Flip';
    elseif mode == 3
        path = 'Rot';
    end

    U = QuickInitilizer(M);
    tic
    [in, out, tin, tout] = AutoData(mode, n, m);
    [U, CList] = TrainNetwork(in, out, U, M, lambda, iter);
    toc

    C = CostNetwork(tin, tout, U, M);
    disp(C)

    plot(CList)

    datafid = fidelity1(tin, tout);
    netout = zeros(dim, dim, n);
    for i = 1:n
        netout(:,:,i) = ApplyNetwork(tin(:,i), U, M);
    end
    netfid = fidelity2(netout, tout);

%     figure
%     hold
%     plot(1:n, datafid, 'r', 'LineWidth', 2)
%     plot(1:n, netfid, 'b', 'LineWidth', 2)
%     xlabel(horzcat('Sample m=',num2str(iii)))
%     ylabel('GHZ Fidelity')
%     saveas(gcf, strcat(path, '_Fid.png'))

    datafidave=[datafidave,mean(datafid)];
    netfidstd = [netfidstd,std(netfid)];
    netfidave=[netfidave,mean(netfid)];

%     figure
%     plot(1:iter, CList, 'LineWidth', 2)
%     xlabel(horzcat('Iteration m=',num2str(iii)))
%     ylabel('Cost')
%     saveas(gcf, strcat(path, '_Cost.png'))
end
% figure
% hold
% %plot(1:iii, datafidave, 'r', 'LineWidth', 2)
% %plot(1:iii, netfidave, 'b', 'LineWidth', 2)
% errorbar(1:1:99,netfidave,netfidstd,'o')
% xlabel('Iteration')
% ylabel('GHZ Fidelity')
% saveas(gcf, strcat(path, '_Fid.png'))
save('m=2,z,zero')

function flist = fidelity1(in, out) % vectors
flist = abs(dot(out, in, 1)).^2;
end

function flist = fidelity2(in, out) % in: density matrices, out: vectors
n = length(out);
flist = zeros(n,1);
for i = 1:n
    flist(i) = real(dot(out(:,i), in(:,:,i)*out(:,i)));
end
end
