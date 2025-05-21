
clear;
list = {'Stim_on', 'Resp_on', 'Stim_off'};

for t2 = 1:size(list, 2)
    n2 = char(list(1, t2));

    datadir = ['C:\Project_AP\Auditory\3_HGA_modulation\Auditory_' n2 '\'];
    savedir = ['C:\Project_AP\Auditory\4_FC_modulation\Auditory_' n2 '\']

    if ~exist(savedir, 'dir')
        mkdir(savedir)
    end

    try
        delete([savedir 'Co_aug_sig_chart.xlsx'])
    catch
    end

    try
        delete([savedir 'Co_att_sig_chart.xlsx'])
    catch
    end

    filename1 = [savedir 'Co_aug_sig_chart.xlsx'];
    filename2 = [savedir 'Co_att_sig_chart.xlsx'];
    row1 = ["roi1" "roi2" "merge"];
    writematrix(row1, filename1, 'Writemode', 'append');
    writematrix(row1, filename2, 'Writemode', 'append');

    for u = 1:67
        ROI_Num1 = u;
        for p = ROI_Num1:67
            q = 1 + p;
            ROI_Num2 = q;

            d1  = [datadir 'Lt_anterior_cingulate_CI.mat'];
            d2  = [datadir 'Lt_anterior_fusiform_CI.mat'];
            d3  = [datadir 'Lt_anterior_inferior_temporal_CI.mat'];
            d4  = [datadir 'Lt_anterior_middle_temporal_CI.mat'];
            d5  = [datadir 'Lt_anterior_superior_frontal_CI.mat'];
            d6  = [datadir 'Lt_anterior_superior_temporal_CI.mat'];
            d7  = [datadir 'Lt_caudalmiddlefrontal_CI.mat'];
            d8  = [datadir 'Lt_cuneus_CI.mat'];
            d9  = [datadir 'Lt_entorhinal_CI.mat'];
            d10 = [datadir 'Lt_inferiorparietal_CI.mat'];
            d11 = [datadir 'Lt_inferior_postcentral_CI.mat'];
            d12 = [datadir 'Lt_inferior_precentral_CI.mat'];
            d13 = [datadir 'Lt_lateraloccipital_CI.mat'];
            d14 = [datadir 'Lt_lateralorbitofrontal_CI.mat'];
            d15 = [datadir 'Lt_lingual_CI.mat'];
            d16 = [datadir 'Lt_medialorbitofrontal_CI.mat'];
            d17 = [datadir 'Lt_paracentral_CI.mat'];
            d18 = [datadir 'Lt_parahippocampal_CI.mat'];
            d19 = [datadir 'Lt_parsopercularis_CI.mat'];
            d20 = [datadir 'Lt_parsorbitalis_CI.mat'];
            d21 = [datadir 'Lt_parstriangularis_CI.mat'];
            d22 = [datadir 'Lt_posterior_cingulate_merge_CI.mat'];
            d23 = [datadir 'Lt_posterior_fusiform_CI.mat'];
            d24 = [datadir 'Lt_posterior_inferior_temporal_CI.mat'];
            d25 = [datadir 'Lt_posterior_middle_temporal_CI.mat'];
            d26 = [datadir 'Lt_posterior_superior_frontal_CI.mat'];
            d27 = [datadir 'Lt_posterior_superior_temporal_CI.mat'];
            d28 = [datadir 'Lt_precuneus_CI.mat'];
            d29 = [datadir 'Lt_rostralmiddlefrontal_CI.mat'];
            d30 = [datadir 'Lt_superiorparietal_CI.mat'];
            d31 = [datadir 'Lt_superior_postcentral_CI.mat'];
            d32 = [datadir 'Lt_superior_precentral_CI.mat'];
            d33 = [datadir 'Lt_supramarginal_CI.mat'];
            d34 = [datadir 'Lt_insula_CI.mat'];
            d35 = [datadir 'Rt_anterior_cingulate_CI.mat'];
            d36 = [datadir 'Rt_anterior_fusiform_CI.mat'];
            d37 = [datadir 'Rt_anterior_inferior_temporal_CI.mat'];
            d38 = [datadir 'Rt_anterior_middle_temporal_CI.mat'];
            d39 = [datadir 'Rt_anterior_superior_frontal_CI.mat'];
            d40 = [datadir 'Rt_anterior_superior_temporal_CI.mat'];
            d41 = [datadir 'Rt_caudalmiddlefrontal_CI.mat'];
            d42 = [datadir 'Rt_cuneus_CI.mat'];
            d43 = [datadir 'Rt_entorhinal_CI.mat'];
            d44 = [datadir 'Rt_inferiorparietal_CI.mat'];
            d45 = [datadir 'Rt_inferior_postcentral_CI.mat'];
            d46 = [datadir 'Rt_inferior_precentral_CI.mat'];
            d47 = [datadir 'Rt_lateraloccipital_CI.mat'];
            d48 = [datadir 'Rt_lateralorbitofrontal_CI.mat'];
            d49 = [datadir 'Rt_lingual_CI.mat'];
            d50 = [datadir 'Rt_medialorbitofrontal_CI.mat'];
            d51 = [datadir 'Rt_paracentral_CI.mat'];
            d52 = [datadir 'Rt_parahippocampal_CI.mat'];
            d53 = [datadir 'Rt_parsopercularis_CI.mat'];
            d54 = [datadir 'Rt_parsorbitalis_CI.mat'];
            d55 = [datadir 'Rt_parstriangularis_CI.mat'];
            d56 = [datadir 'Rt_posterior_cingulate_merge_CI.mat'];
            d57 = [datadir 'Rt_posterior_fusiform_CI.mat'];
            d58 = [datadir 'Rt_posterior_inferior_temporal_CI.mat'];
            d59 = [datadir 'Rt_posterior_middle_temporal_CI.mat'];
            d60 = [datadir 'Rt_posterior_superior_frontal_CI.mat'];
            d61 = [datadir 'Rt_posterior_superior_temporal_CI.mat'];
            d62 = [datadir 'Rt_precuneus_CI.mat'];
            d63 = [datadir 'Rt_rostralmiddlefrontal_CI.mat'];
            d64 = [datadir 'Rt_superiorparietal_CI.mat'];
            d65 = [datadir 'Rt_superior_postcentral_CI.mat'];
            d66 = [datadir 'Rt_superior_precentral_CI.mat'];
            d67 = [datadir 'Rt_supramarginal_CI.mat'];
            d68 = [datadir 'Rt_insula_CI.mat'];

            switch ROI_Num1
                case 1;  dname1 = d1;  case 2;  dname1 = d2;
                case 3;  dname1 = d3;  case 4;  dname1 = d4;
                case 5;  dname1 = d5;  case 6;  dname1 = d6;
                case 7;  dname1 = d7;  case 8;  dname1 = d8;
                case 9;  dname1 = d9;  case 10; dname1 = d10;
                case 11; dname1 = d11; case 12; dname1 = d12;
                case 13; dname1 = d13; case 14; dname1 = d14;
                case 15; dname1 = d15; case 16; dname1 = d16;
                case 17; dname1 = d17; case 18; dname1 = d18;
                case 19; dname1 = d19; case 20; dname1 = d20;
                case 21; dname1 = d21; case 22; dname1 = d22;
                case 23; dname1 = d23; case 24; dname1 = d24;
                case 25; dname1 = d25; case 26; dname1 = d26;
                case 27; dname1 = d27; case 28; dname1 = d28;
                case 29; dname1 = d29; case 30; dname1 = d30;
                case 31; dname1 = d31; case 32; dname1 = d32;
                case 33; dname1 = d33; case 34; dname1 = d34;
                case 35; dname1 = d35; case 36; dname1 = d36;
                case 37; dname1 = d37; case 38; dname1 = d38;
                case 39; dname1 = d39; case 40; dname1 = d40;
                case 41; dname1 = d41; case 42; dname1 = d42;
                case 43; dname1 = d43; case 44; dname1 = d44;
                case 45; dname1 = d45; case 46; dname1 = d46;
                case 47; dname1 = d47; case 48; dname1 = d48;
                case 49; dname1 = d49; case 50; dname1 = d50;
                case 51; dname1 = d51; case 52; dname1 = d52;
                case 53; dname1 = d53; case 54; dname1 = d54;
                case 55; dname1 = d55; case 56; dname1 = d56;
                case 57; dname1 = d57; case 58; dname1 = d58;
                case 59; dname1 = d59; case 60; dname1 = d60;
                case 61; dname1 = d61; case 62; dname1 = d62;
                case 63; dname1 = d63; case 64; dname1 = d64;
                case 65; dname1 = d65; case 66; dname1 = d66;
                case 67; dname1 = d67;
            end

            switch ROI_Num2
                case 2;  dname2 = d2;  case 3;  dname2 = d3;
                case 4;  dname2 = d4;  case 5;  dname2 = d5;
                case 6;  dname2 = d6;  case 7;  dname2 = d7;
                case 8;  dname2 = d8;  case 9;  dname2 = d9;
                case 10; dname2 = d10; case 11; dname2 = d11;
                case 12; dname2 = d12; case 13; dname2 = d13;
                case 14; dname2 = d14; case 15; dname2 = d15;
                case 16; dname2 = d16; case 17; dname2 = d17;
                case 18; dname2 = d18; case 19; dname2 = d19;
                case 20; dname2 = d20; case 21; dname2 = d21;
                case 22; dname2 = d22; case 23; dname2 = d23;
                case 24; dname2 = d24; case 25; dname2 = d25;
                case 26; dname2 = d26; case 27; dname2 = d27;
                case 28; dname2 = d28; case 29; dname2 = d29;
                case 30; dname2 = d30; case 31; dname2 = d31;
                case 32; dname2 = d32; case 33; dname2 = d33;
                case 34; dname2 = d34; case 35; dname2 = d35;
                case 36; dname2 = d36; case 37; dname2 = d37;
                case 38; dname2 = d38; case 39; dname2 = d39;
                case 40; dname2 = d40; case 41; dname2 = d41;
                case 42; dname2 = d42; case 43; dname2 = d43;
                case 44; dname2 = d44; case 45; dname2 = d45;
                case 46; dname2 = d46; case 47; dname2 = d47;
                case 48; dname2 = d48; case 49; dname2 = d49;
                case 50; dname2 = d50; case 51; dname2 = d51;
                case 52; dname2 = d52; case 53; dname2 = d53;
                case 54; dname2 = d54; case 55; dname2 = d55;
                case 56; dname2 = d56; case 57; dname2 = d57;
                case 58; dname2 = d58; case 59; dname2 = d59;
                case 60; dname2 = d60; case 61; dname2 = d61;
                case 62; dname2 = d62; case 63; dname2 = d63;
                case 64; dname2 = d64; case 65; dname2 = d65;
                case 66; dname2 = d66; case 67; dname2 = d67;
                case 68; dname2 = d68;
            end

            [~, name, ~] = fileparts(dname1);
            Side1 = name(1:2);
            ROI1  = eraseBetween(name, 1, 3);
            ROI1  = erase(ROI1, '_CI');

            [~, name, ~] = fileparts(dname2);
            Side2 = name(1:2);
            ROI2  = eraseBetween(name, 1, 3);
            ROI2  = erase(ROI2, '_CI');

            Condition = n2;
            switch Condition
                case 'Stim_on';  Tmin = -200; Tmax = 800;  bin = 81:281;
                case 'Resp_on';  Tmin = -800; Tmax = 800;  bin = 241:561;
                case 'Stim_off'; Tmin = -800; Tmax = 800;  bin = 361:681;
            end
            xrange = [Tmin Tmax];

            load(dname1);
            testdata_sig1 = testdata_sig;
            whole_bin     = size(testdata_sig, 2);

            load(dname2);
            testdata_sig2 = testdata_sig;

            testdata_sig = testdata_sig1 + testdata_sig2;
            testdata_sig(testdata_sig == -1) = 0;
            testdata_sig(testdata_sig ==  1) = 0;
            testdata_sig(testdata_sig == -2) = -1;
            testdata_sig(testdata_sig ==  2) = 1;
            T = testdata_sig;

            clearvars -except list savedir datadir bin whole_bin T Side1 Side2 ROI1 ROI2 ...
                              Condition Co_mod50 x ROI_Num1 ROI_Num2 t2 n2 filename1 filename2 u ...
                              xrange Tmin Tmax testdata_sig1 testdata_sig2

            T           = T(bin);
            Co_aug_sig  = T; Co_aug_sig(Co_aug_sig < 0) = 0;

            a = find([0 Co_aug_sig] ~= 0);
            switch isempty(a)
                case 1
                    vs_sig = [];
                case 0
                    vs = a(find(diff([0 a]) > 1)) - 1;
                    ve = [a(find(diff(a) > 1)) a(end)] - 1;
                    gap      = ve - vs + 1;
                    gap_sig  = gap;  gap_sig(gap <= 4) = [];
                    ve_sig   = ve;   ve_sig(gap <= 4) = [];
                    vs_sig   = vs;   vs_sig(gap <= 4) = [];
            end

            switch isempty(vs_sig)
                case 1
                    range = [];
                case 0
                    Co_aug_sig_num = numel(vs_sig);
                    if Co_aug_sig_num == 1
                        range = vs_sig(1, 1):ve_sig(1, 1);
                    else
                        range = cell(Co_aug_sig_num, 1);
                        for i = 1:Co_aug_sig_num
                            range{i} = vs_sig(1, i):ve_sig(1, i);
                        end
                        range = [range{:}];
                    end
            end

            Co_aug_sig = zeros(1, max(bin) - min(bin) + 1);
            Co_aug_sig(range) = 1;

            A = zeros(1, min(bin) - 1);
            B = zeros(1, max(whole_bin) - (max(bin) + 1) + 1);
            Co_aug_sig = [A Co_aug_sig B];

            Co_aug_sig = Co_aug_sig(bin);
            Co_aug_sig = movmean(Co_aug_sig, 2);

            Co_att_sig  = T; Co_att_sig(Co_att_sig > 0) = 0;

            b = find([0 Co_att_sig] ~= 0);
            switch isempty(b)
                case 1
                    vs_sig = [];
                case 0
                    vs = b(find(diff([0 b]) > 1)) - 1;
                    ve = [b(find(diff(b) > 1)) b(end)] - 1;
                    gap      = ve - vs + 1;
                    gap_sig  = gap;  gap_sig(gap <= 4) = [];
                    ve_sig   = ve;   ve_sig(gap <= 4) = [];
                    vs_sig   = vs;   vs_sig(gap <= 4) = [];
            end

            switch isempty(vs_sig)
                case 1
                    range = [];
                case 0
                    Co_att_sig_num = numel(vs_sig);
                    if Co_att_sig_num == 1
                        range = vs_sig(1, 1):ve_sig(1, 1);
                    else
                        range = cell(Co_att_sig_num, 1);
                        for i = 1:Co_att_sig_num
                            range{i} = vs_sig(1, i):ve_sig(1, i);
                        end
                        range = [range{:}];
                    end
            end

            Co_att_sig = zeros(1, max(bin) - min(bin) + 1);
            Co_att_sig(range) = -1;

            A = zeros(1, min(bin) - 1);
            B = zeros(1, max(whole_bin) - (max(bin) + 1) + 1);
            Co_att_sig = [A Co_att_sig B];

            Co_att_sig = Co_att_sig(bin);
            Co_att_sig = movmean(Co_att_sig, 2);

            Co_mod50       = Co_aug_sig + Co_att_sig;
            x              = Tmin:5:Tmax;
            Co_mod50_length = x;
 
            trans = readcell("E:\For_github\Script\name_trans_yk1_35ROI.xlsx");
            r1    = join({Side1, ROI1}, '_');
            r2    = join({Side2, ROI2}, '_');
            ind1  = strmatch(r1, trans(:, 1), 'exact');
            R1    = string(trans(ind1, 2));
            ind2  = strmatch(r2, trans(:, 1), 'exact');
            R2    = string(trans(ind2, 2));
           save([savedir char(R1) '_' char(R2) '.mat'], 'Co_mod50', 'Co_mod50_length')
            if max(Co_mod50) == 1
                row2 = [string(R1) string(R2) string(join([R1 R2], '_'))];
                writematrix(row2, filename1, 'Writemode', 'append');
            end
            clear row2

            if min(Co_mod50) == -1
                row2 = [string(R1) string(R2) string(join([R1 R2], '_'))];
                writematrix(row2, filename2, 'Writemode', 'append');
            end
            clear row2
        end
    end
end
