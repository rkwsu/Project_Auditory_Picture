clear;
addpath('C:\Project_AP\Script');
addpath('C:\Project_AP\Script\fieldtrip');
addpath('C:\Project_AP\Script\fieldtrip\utilities');
addpath('C:\Project_AP\Script\fieldtrip\plotting');

bands  = {'HG'};
tasks  = {'Stim_on','Stim_off','Resp_on'};
stat   = '9999CI';
span   = 200;
method = 'both';

Connect_thres      = 0.5;
min_transparency   = 0.5;
NF      = '1000';
NS      = '500000';
NSK     = [num2str(str2num(NS)/1000) 'k'];
thres   = '0.05';
SS      = '0';

for b = 1:numel(bands)
    band = bands{b};
    for t = 1:numel(tasks)
        task = tasks{t};

        datadir = ['C:\Project_AP\Auditory\6_Dynamic_Tractography_Movie_Data\Auditory_' task '\'];
        savedir = ['C:\Project_AP\Auditory\7_Dynamic_Tractography_Movie\Auditory_' task '\'];
        if ~exist(savedir,'dir'), mkdir(savedir); end
        cd(savedir);

        savename = fullfile(savedir, ...
            ['tract_' stat '_' method '_' band '_' task '_' NSK ...
             '_fa_threshold_' thres '_stepsize_' SS]);

        Tract1 = load([datadir, 'tract_' stat '_' method '_' band '_' task '.mat']);
        Tract2 = Tract1;

        switch task
            case 'Stim_on'
                left_name        = 'Stim-on';
                movie_time_range = [-200 500];
                Snapshot_time    = [0];
            case 'Stim_off'
                left_name        = 'Stim-off';
                movie_time_range = [-500 500];
                Snapshot_time    = [0];
            case 'Resp_on'
                left_name        = 'Resp-on';
                movie_time_range = [-500 500];
                Snapshot_time    = [0];
        end
        right_name  = left_name;
        fontsize    = 2;
        Export_Movie = 1;
        frame_number = 3;
        Export_Fig   = 1;

        amp_color_range = [-1 1];
        Timeunit        = 5;

        Side1            = Tract1.Data.tract_name;
        Side2            = Tract2.Data.tract_name;
        Setting.fnum     = size(Tract1.Data.Alpha,2);
        Setting.Time_all = Tract1.Data.time;

        Alpha1  = Tract1.Data.Alpha';
        Alpha2  = Alpha1;
        Tract_1 = Tract1.Tract;
        Tract_2 = Tract_1;

        Title = 'connectivity';

        [~, ftpath] = ft_version;
        mesh_lh = load([ftpath filesep 'template/anatomy/surface_pial_left.mat']);
        mesh_rh = load([ftpath filesep 'template/anatomy/surface_pial_right.mat']);

        isInter1 = contains(Side1,'left') & contains(Side1,'right');
        isInter2 = contains(Side2,'left') & contains(Side2,'right');

        Generating_movies_DTI_ks4yk7ak1_intra_inter_mixed( ...
            Alpha1, Alpha2, Setting, savename, amp_color_range, Timeunit, ...
            frame_number, movie_time_range, fontsize, Title, ...
            left_name, right_name, Export_Movie, Export_Fig, Snapshot_time, ...
            Tract_1, Tract_2, mesh_lh, mesh_rh, ...
            Side1, Side2, isInter1, isInter2);
    end
end
