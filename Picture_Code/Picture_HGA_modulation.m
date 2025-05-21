clear;
list = {'Stim_on','Resp_on'};
for side = {'Rt','Lt'}
    for t = 1:numel(list)
        n2 = char(list(t));
        for k = 1:34
            CI = []; 
            bin_width = 5;
            dname1  = ['C:\Project_AP\Picture\1_Group_Data\Group_' n2 '_Dataset.mat'];
            savedir = ['C:\Project_AP\Picture\3_HGA_modulation\Picture_' n2 '\'];
            if ~exist(savedir,'dir'); mkdir(savedir); end
            Side      = char(side);
            Condition = n2;
            ROI_Num   = k;
            switch Condition
                case 'Stim_on';  Tmin = -600;  Tmax = 2400;  bin = 1:601;
                case 'Resp_on';  Tmin = -2000; Tmax = 2000;  bin = 1:801;
            end
            Twindow    = Tmin:5:Tmax;
            Time_range = [Tmin Tmax];
            switch ROI_Num
                case  1; ROI='anterior_cingulate';        case  2; ROI='anterior_fusiform';
                case  3; ROI='anterior_inferior_temporal';case  4; ROI='anterior_middle_temporal';
                case  5; ROI='anterior_superior_frontal'; case  6; ROI='anterior_superior_temporal';
                case  7; ROI='caudalmiddlefrontal';       case  8; ROI='cuneus';
                case  9; ROI='entorhinal';                case 10; ROI='inferiorparietal';
                case 11; ROI='inferior_postcentral';      case 12; ROI='inferior_precentral';
                case 13; ROI='lateraloccipital';          case 14; ROI='lateralorbitofrontal';
                case 15; ROI='lingual';                   case 16; ROI='medialorbitofrontal';
                case 17; ROI='paracentral';               case 18; ROI='parahippocampal';
                case 19; ROI='parsopercularis';           case 20; ROI='parsorbitalis';
                case 21; ROI='parstriangularis';          case 22; ROI='posterior_cingulate_merge';
                case 23; ROI='posterior_fusiform';        case 24; ROI='posterior_inferior_temporal';
                case 25; ROI='posterior_middle_temporal'; case 26; ROI='posterior_superior_frontal';
                case 27; ROI='posterior_superior_temporal';case 28; ROI='precuneus';
                case 29; ROI='rostralmiddlefrontal';      case 30; ROI='superiorparietal';
                case 31; ROI='superior_postcentral';      case 32; ROI='superior_precentral';
                case 33; ROI='supramarginal';             case 34; ROI='insula';
            end
            load(dname1);
            A = Dataset(:, 'effect');
            A = table2array(A) - 1;
            A(A < 0) = 1;
            A = logical(A);
            Dataset(A,:)                 = [];
            Data.Band_percentchange(A,:,:)= [];
            Data.Label(A,:)              = [];
            Data.ID(A,:)                 = [];
            d1        = Data.Band_percentchange(strcmp(Dataset.LR,Side) & strcmp(Dataset.label,ROI),:,2);
            whole_bin = size(Data.Time,2);
            if size(d1,1) > 1
                SD = std(d1);
                SE = SD / sqrt(size(d1,1));
                NF = 3.89 * SE;
                CI(1,:) = mean(d1) - NF;
                CI(2,:) = mean(d1) + NF;
            else
                CI = zeros(2,length(bin));
                Taug_sum     = 0;
                Tatt_sum     = 0;
                testdata_sig = zeros(1,length(bin));
                if isfield(Data,'Band_percentchange')
                    Data = rmfield(Data,'Band_percentchange');
                end
                save([savedir Side '_' ROI '_CI.mat'],'Data','Dataset','testdata_sig','Taug_sum','Tatt_sum');
                continue
            end
            Data.CI_HGA = CI;
            testdata     = CI(:,bin);
            test_low     = testdata(1,:);  test_low(test_low>0)=1; test_low(test_low<0)=0;
            a            = find([0 test_low]~=0);
            if isempty(a)
                Caug = [];
            else
                vs = a(find(diff([0 a])>1))-1;
                ve = [a(find(diff(a)>1)) a(end)]-1;
                Caug = cell2mat(arrayfun(@(x,y)x:y,vs(ve-vs+1>4),ve(ve-vs+1>4),'UniformOutput',false));
            end
            test_aug = zeros(1,max(bin)-min(bin)+1);
            if ~isempty(Caug); test_aug(Caug)=1; end
            test_aug = [zeros(1,min(bin)-1) test_aug zeros(1,max(whole_bin)-(max(bin)+1)+1)];
            test_high    = testdata(2,:);  test_high(test_high>0)=0; test_high(test_high<0)=-1;
            b            = find([0 test_high]~=0);
            if isempty(b)
                Catt = [];
            else
                vs = b(find(diff([0 b])>1))-1;
                ve = [b(find(diff(b)>1)) b(end)]-1;
                Catt = cell2mat(arrayfun(@(x,y)x:y,vs(ve-vs+1>4),ve(ve-vs+1>4),'UniformOutput',false));
            end
            test_att = zeros(1,max(bin)-min(bin)+1);
            if ~isempty(Catt); test_att(Catt)=-1; end
            test_att = [zeros(1,min(bin)-1) test_att zeros(1,max(whole_bin)-(max(bin)+1)+1)];
            testdata_sig       = test_aug + test_att;
            if t == 1; testdata_sig(:,1:60)=0; end
            T        = testdata_sig(bin);
            Taug_sum = sum(max(T,0));
            Tatt_sum = sum(abs(min(T,0)));
            if isfield(Data,'Band_percentchange')
                Data = rmfield(Data,'Band_percentchange');
            end
            save([savedir Side '_' ROI '_CI.mat'],'Data','Dataset','testdata_sig','Taug_sum','Tatt_sum');
            clearvars -except t ROI Side n2 bin_width list side
        end
    end
end
