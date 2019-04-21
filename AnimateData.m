clear all; close all; clc;

AllData = cell(1,8);
load('micahData.mat');
AllData{1} = CMat;
AllData{2} = EmisMat;
AllData{3} = FiltMat;
AllData{4} = GreaseMat;
AllData{5} = HMat;
AllData{6} = RawModelMat;
AllData{7} = AmbMat;
AllData{8} = BlackMat;

xtick = [1 2 3 4 5 6];
ytick = [1 2 3 4 5];

configdir = dir('config');
configdir = configdir(3:end);


for J = 1:length(configdir)
configfile = importdata(['config/' configdir(J).name]);
%
% Change this stuff
data = AllData{J};

name_IP = configfile.name_IP;
name_Ref = configfile.name_Ref;
minC = configfile.minC;
maxC = configfile.maxC;

tic;
%% IP

h1 = figure('visible','off');
ax1 = gca;
vid1 = VideoWriter(name_IP,'MPEG-4');
vid1.FrameRate = 60;
open(vid1);

framenum = length(data);

for i = 1:3:framenum
 
    imAlpha = ones(size(data{i,1}));
    imAlpha(isnan(data{i,1})) = 0;
    imagesc(data{i,1},'AlphaData',imAlpha);
    set(ax1,'color',0*[1 1 1], 'XTick', xtick, 'YTick', ytick)
    axis image; colorbar; caxis(ax1,[minC maxC]);
    
    for x = 1:5
        for y = 1:6
            text(y-0.2,x,num2str(data{i,1}(x,y)),'FontSize',14);
        end
    end
    
    drawnow;
    frame = getframe(h1);
    writeVideo(vid1,frame)

end

close(vid1)
toc;
tic;
%% Ref Data
h2 = figure('visible','off');
ax2 = gca;

set(ax2,'color',0*[1 1 1]);

vid2 = VideoWriter(name_Ref,'MPEG-4');
vid2.FrameRate = 60;
open(vid2);

framenum = length(data);

for i = 1:3:framenum
 
    imAlpha = ones(size(data{i,2}));
    imAlpha(isnan(data{i,2})) = 0;
    imagesc(data{i,2},'AlphaData',imAlpha);
    set(ax2,'color',0*[1 1 1], 'XTick', xtick, 'YTick', ytick)
    axis image; colorbar; caxis(ax2,[minC maxC]);
    
    for x = 1:5
        for y = 1:6
            text(y-0.2,x,num2str(data{i,2}(x,y)),'FontSize',14);
        end
    end
    
    drawnow;
    frame = getframe(h2);
    writeVideo(vid2,frame)

end

close(vid2)
toc;

end