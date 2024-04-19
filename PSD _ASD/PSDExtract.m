% folder = 'PSD_data';
mkdir('PSD_data');

Num        =  [52 54];
Group     =   {'ASD' 'NC'};
for g  = 1 : length(Group)
   for nSub = 1 : Num(g)

    if strcmp(Group(g),'ASD')
       load([ 'ROI_data\ASD\ROISignals_sub', num2str(nSub), '.mat']);
       ROI_tmp=ROISignals;
       RHO = listPSD(ROI_tmp);
       save([ 'PSD_data\ASD_PSD_', num2str(nSub), '.mat'],'RHO');
    elseif strcmp(Group(g),'NC')
       load([ 'ROI_data\NC\ROISignals_sub', num2str(nSub), '.mat']);
       ROI_tmp=ROISignals;
        RHO = listPSD(ROI_tmp);
       save([ 'PSD_data\NC_PSD_', num2str(nSub), '.mat'],'RHO');
    end

   end
end

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Num        =  [52 54];
Group     =   {'ASD' 'NC'};

for g  = 1 : length(Group)
    for nSub = 1 : Num(g)
        
        if strcmp(Group(g),'ASD')
            load([ 'PSD_data\ASD_PSD_', num2str(nSub), '.mat']);
            for i=1:116
                ASD_Valmean(nSub,i)=RHO{1,i}{1,2};
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

[h,p,ci,stats]=ttest2(ASD_Valmean,NC_Valmean);
