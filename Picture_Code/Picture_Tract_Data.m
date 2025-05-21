%% STEP1
clear
%-------------------------------------------------------------
bands   = {'HG'};
tasks   = {'Stim_on','Resp_on'};
stat    = '9999CI';         
method  = 'both';            
NF      = '1000';
NS      = '500000';
NSK     = [num2str(str2num(NS)/1000) 'k'];   
thres   = '0.05';
SS      = '0';
%---------------------------------------------------------------
rootDir      = 'C:\Project_AP\';
tractlibFile = [rootDir 'Track_Data\All_ROI2ROI_' ...
                NSK '_fa0p05_stepsize' SS '.mat'];
load(tractlibFile,'allTracts');    % ライブラリを一度だけ読み込む

%---------------------------------------------------------------
for b = 1:numel(bands)
    band = bands{b};
    for t = 1:numel(tasks)
        task    = tasks{t};
        datadir = [rootDir 'Picture\4_FC_modulation\Picture_' task '\'];
        savedir = [rootDir 'Picture\5_Dynamic_Tractography_Data\Picture_' task '\'];
        if ~exist(savedir,'dir'), mkdir(savedir), end

        % ─ read sig-chart (3rd col = ROI-pair key) ─
        Sub_name1 = readcell([datadir 'Co_aug_sig_chart.xlsx']);
        Sub_name2 = readcell([datadir 'Co_att_sig_chart.xlsx']);
        Sub_name  = vertcat(Sub_name1(2:end,3), Sub_name2(2:end,3));

        %
        for o = 1:numel(Sub_name)
            ss  = Sub_name{o};                     
            key = matlab.lang.makeValidName(ss);    

            if ~isfield(allTracts,key),  continue,  end  

            tracts2 = allTracts.(key).tracts;   
            lenVec  = allTracts.(key).length;   

            % 
            Tr = {};
            for j = 1:numel(lenVec)
                seg             = lenVec(j);
                Tr{end+1}       = tracts2(:,1:seg); 
                tracts2(:,1:seg)= [];
            end

            % 
            LE = zeros(1,numel(Tr));
            for j = 1:numel(Tr)
                coords = Tr{j}';
                d      = diff(coords);
                LE(j)  = sum( sqrt(sum(d.^2,2)) );
            end
            [~,I]  = min(LE);
            p_tracts = Tr{I};                  

            % 
            p_tracts(1,:) = -p_tracts(1,:) + 78;
            p_tracts(2,:) = -p_tracts(2,:) + 76;
            p_tracts(3,:) =  p_tracts(3,:) - 50;

            % 
            fout = fullfile(savedir, ...
                ['shortest_' stat '_' method '_' ss '_' band '_' task '.mat']);
            p_tracts = p_tracts.';            
            save(fout,'p_tracts','-v7.3');

            clear tracts2 lenVec Tr LE p_tracts
        end
    end
end

%% STEP2
clear;
% 
bands = {'HG'}; 
tasks = {'Stim_on', 'Resp_on'}; 
stat = '9999CI'; 
span = 200;
method = 'both'; 
% 
Connect_thres = 0.5 ;
min_transparency = 0.5;
% 
NF = '1000';
NS = '500000';
NSK = strcat(num2str(str2num(NS)/1000), 'k');
thres = '0.01';
SS = '0';
% 

    for band = bands
        band = cell2mat(band);
        for t2=1:size(tasks,2) 
        task=cell2mat(tasks(t2));
            
            datadir=(['C:\Project_AP\Picture\4_FC_modulation\Picture_' task '\']);
            tractdir= ['C:\Project_AP\Picture\5_Dynamic_Tractography_Data\Picture_' task '\'];
            savedir=(['C:\Project_AP\Picture\6_Dynamic_Tractography_Movie_Data\Picture_' task '\']);
            if ~exist(savedir,'dir')
                mkdir(savedir)
            end

           dlist_pre1=readcell([datadir 'Co_aug_sig_chart.xlsx']); Sub_name1=dlist_pre1(2:end,3);
           dlist_pre2=readcell([datadir 'Co_att_sig_chart.xlsx']); Sub_name2=dlist_pre2(2:end,3);
           Sub_name=vertcat(Sub_name1,Sub_name2);

            tract_name = [];
            Val = [];
            Tract = [];
            for o = 1:size(Sub_name,1)
                s = Sub_name(o);
                ss = cell2mat(s);
                sss = find(ismember(Sub_name,ss));
                t = dir([tractdir,'shortest_' stat '_' method '_' ss '_' band '_' task '.mat']);
                if ~isempty(t)
                    tract = load([tractdir,'shortest_' stat '_' method '_' ss '_' band '_' task '.mat']);
                    load([datadir, ss '.mat']);
                    val = Co_mod50; % merge
                    tract_name = cat(1,tract_name,cellstr(ss));
                    Val = cat(1,Val,val);
                    Tract = cat(1,Tract,{tract.p_tracts});
                    clear val
                end
                clear ss sss tract t
            end
            time = Co_mod50_length; clear Co_mod50 Co_mod50_length

            % 
            ALPHA = [];
            for j = 1:size(Val,1)
                data = Val(j,:);
                data(abs(data)<Connect_thres) = 0;
                Abs = abs(data);
                diff = linspace(Connect_thres,1,Connect_thres*100+1);
                trans = linspace(min_transparency,1,Connect_thres*100+1);
                Alpha = zeros(1,size(Abs,2));
                for a = 1:size(Abs,2)
                    A = Abs(a);
                    if ~(A == 0) & ~isnan(A)
                        [B,I] = min(abs(diff-A));
                        C = trans(I);
                        Alpha(a) = C;
                        clear A B C I
                    end
                end
                M = find(data < 0);
                Alpha(M) = -(Alpha(M));
                ALPHA = cat(1,ALPHA,Alpha);
                clear data Abs diff trans Alpha
            end
            % ****************************************
            Data.tract_name = tract_name;
            Data.time = time;
            Data.Alpha = ALPHA;
            clear tract_name time Val ALPHA

            % save tract and transparency information
            save(fullfile(savedir,['tract_' ...
                stat '_' method '_' band '_' task '.mat']),'Tract','Data','-v7.3');
            clear Tract Data
        end
    end