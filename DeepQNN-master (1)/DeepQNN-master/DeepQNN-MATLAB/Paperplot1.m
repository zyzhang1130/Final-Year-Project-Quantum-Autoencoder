
savename1 = 'pp1_a';
load('Dat/plot_dsf_test_ex8_train1_test1', 'noise', 'fid', 'sdv')
fid1 = fid;
sdv1 = sdv;
load('Dat/plot_dsf_test_ex10_train6_test1', 'fid', 'sdv')
noise1 = noise;
fid1 = cat(2, fid1, fid{end});
sdv1 = cat(2, sdv1, sdv{end});
legend1 = ["expected noise", "noisy sample", "[4,2,1,2,4] denoised", "[4,1,4,1,4] denoised"];

PlotDenoisingVsNoise(noise1, fid1,...
    'sdv_fidelity', sdv1, 'savename', savename1, 'legend', legend1, 'lposition', [0.31,0.21],...
    'xlabel', 'spin-flip probability p', 'ylabel', 'fidelity with GHZ-0',...
    'plotstyle', {{"+",'MarkerSize', 5, 'LineWidth', 1.5, 'CapSize', 0},...
    {".", 'MarkerSize', 25, 'LineWidth', 1.5},...
    {"o", 'MarkerSize', 10, 'LineWidth', 1.5, 'CapSize', 20},...
    {"x", 'MarkerSize', 10, 'LineWidth', 1.5, 'CapSize', 15}})

savename2 = 'pp1_b';
load('Dat/plot_du_test_ex8_train1_test1', 'noise', 'fid', 'sdv')
fid2 = fid;
sdv2 = sdv;
load('Dat/plot_du_test_ex10_train3_test1', 'fid', 'sdv')
noise2 = noise;
fid2 = cat(2, fid2, fid{end});
sdv2 = cat(2, sdv2, sdv{end});
legend2 = ["noisy", "[4,2,1,2,4] \newlinedenoised", "[4,1,4,1,4] \newlinedenoised"];

PlotDenoisingVsNoise(noise2, fid2,...
    'sdv_fidelity', sdv2, 'savename', savename2, 'legend', legend2, 'lposition', [0.25,0.235],...
    'xlabel', 'noise strength q', 'ylabel', 'fidelity with GHZ-0',...
    'plotstyle', {{".", 'MarkerSize', 25, 'LineWidth', 1.5, 'Color', [0.85,0.325,0.098]},...
    {"o", 'MarkerSize', 10, 'LineWidth', 1.5, 'CapSize', 20, 'Color', [0.929,0.694,0.125]},...
    {"x", 'MarkerSize', 10, 'LineWidth', 1.5, 'CapSize', 15, 'Color', [0.494,0.184,0.556]}})