% % folder = 'PSD_data';
% mkdir('PSD_data');
%
% Num        =  [19 23];
% Group     =   {'MCI' 'NC'};
% for g  = 1 : length(Group)
%    for nSub = 1 : Num(g)
%
%     if strcmp(Group(g),'MCI')
%        load([ 'ROI_data\MCI\MCI_', num2str(nSub), '.mat']);
%        ROI_tmp=ROISignals;
%        RHO = listPSD(ROI_tmp);
%        save([ 'PSD_data\MCI_PSD_', num2str(nSub), '.mat'],'RHO');
%     elseif strcmp(Group(g),'NC')
%        load([ 'ROI_data\NC\NC_', num2str(nSub), '.mat']);
%        ROI_tmp=ROISignals;
%         RHO = listPSD(ROI_tmp);
%        save([ 'PSD_data\NC_PSD_', num2str(nSub), '.mat'],'RHO');
%     end
%
%    end
% end

%%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Num        =  [19 23];
Group     =   {'MCI' 'NC'};

for g  = 1 : length(Group)
    for nSub = 1 : Num(g)
        
        if strcmp(Group(g),'MCI')
            load([ 'PSD_data\MCI_PSD_', num2str(nSub), '.mat']);
            for i=1:116
                MCI_Valmean(nSub,i)=RHO{1,i}{1,2};
            end
        end
        if strcmp(Group(g),'NC')
            load([ 'PSD_data\NC_PSD_', num2str(nSub), '.mat']);
            for i=1:116
                NC_Valmean(nSub,i)=RHO{1,i}{1,2};
            end
        end
    end
end

[h,p,ci,stats]=ttest2(MCI_Valmean,NC_Valmean);
