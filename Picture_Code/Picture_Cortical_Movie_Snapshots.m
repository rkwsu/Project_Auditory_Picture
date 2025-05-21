clear
% *** 
cd('C:\Project_AP\Script')
addpath('C:\Project_AP\Script\knn')

% ***
fsadir = 'C:\Project_AP\Script\fsaverage';
conditions = {'Stim_on'}; %'Stim_on', 'Resp_on', 'Stim_off'
datasets = {'Group_Stim_on_Dataset.mat'}; %'Group_Stim_on_Dataset.mat', 'Group_Resp_on_Dataset.mat', 'Group_Stim_off_Dataset.mat'
movie_time_ranges = {[0 500]};
snapshot_times = { [ 0 ]};

for condIdx = 1:length(conditions)
    savedir = (['C:\Project_AP\Picture\2_Cortical_Movie\\' conditions{condIdx}]);
    if ~exist(savedir,'dir')
        mkdir(savedir);
    end

    % ****** movie setting *********
    radius_r = 100;
    radius_k = 200;
    Num_Thre = 1; % 
    Band = 'High_gamma';
    Exclude = {'bad', 'onset', 'spiking'};
    % ******************************

    % *** 
    data1 = load(['C:\Project_AP\Picture\1_Group_Data\\' datasets{condIdx}]); % Left 3D brain
    data2 = load(['C:\Project_AP\Picture\1_Group_Data\\' datasets{condIdx}]); % Right 3D brain

    % 
    A = data1.Dataset(:,'effect');
    A = table2array(A);
    A = A - 1;
    A(A < 0) = 1;
    A = logical(A);
    data1.Dataset(A,:) = [];
    data1.Data.Band_percentchange(A,:,:) = [];
    data1.Data.Label(A,:) = [];
    data1.Data.ID(A,:) = [];
    data2.Dataset(A,:) = [];
    data2.Data.Band_percentchange(A,:,:) = [];
    data2.Data.ID(A,:) = [];

    clear A;

    % *** 
    data = data1.Data.Band_percentchange(:,:,strcmp(data1.Data.Band_name,Band));
    data = cat(3,data,data2.Data.Band_percentchange(:,:,strcmp(data2.Data.Band_name,Band)));
    Dataset = data1.Dataset;
    Dataset.Properties.VariableNames{1} = 'ID';
    Dataset.Properties.VariableNames{2} = 'Side';
    ind_exclude = isnan(Dataset{:,'fsaverage'}) | sum(Dataset{:,Exclude},2) > 0;
    data(ind_exclude,:,:) = [];
    Dataset(ind_exclude,:) = [];
    time = data1.Data.Time;

    % *** make dataset for HGA animation on 3D brain ***
    savename = fullfile(savedir,['Datasets_k' num2str(radius_k) '_r' num2str(radius_r) '_Threshold_' num2str(Num_Thre)]);
    [Data, Setting] = Making_dataset_ms_ak1(data,time,Dataset,fsadir,savename,radius_r,radius_k,Num_Thre);

    %% 
    % ***** 
    fontsize = 2;
    Title = conditions{condIdx};
    left_name = 'Picture';
    right_name = 'Picture';
    amp_color_range = [-20 20];
    Timeunit = 5; % ms

    % *** 
    Export_Movie = 1; % 1 = generate movie file
    movie_time_range = movie_time_ranges{condIdx};
    frame_number = 3; % Increase to slow motion

    % ***
    Export_Fig = 1; % 1 = generate snapshot file
    Snapshot_time = snapshot_times{condIdx};

    % *** generate movie ***
    Generating_movies_ms_CYR(Data,Setting,fsadir,savename,amp_color_range,Timeunit,frame_number,movie_time_range,fontsize,Title,left_name,right_name,Export_Movie,Export_Fig,Snapshot_time)
end
