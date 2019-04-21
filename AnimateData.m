clear all; close all; clc;

% Read in Animation Frames and store in CellArray
AllData = cell(1,8);
load('AnimationFrames.mat');
AllData{1} = CMat;
AllData{2} = EmisMat;
AllData{3} = FiltMat;
AllData{4} = GreaseMat;
AllData{5} = HMat;
AllData{6} = RawModelMat;
AllData{7} = AmbMat;
AllData{8} = BlackMat;

% set x and y ticks
xtick = [1 2 3 4 5 6];
ytick = [1 2 3 4 5];

% get test case configurations
configdir = dir('config');
configdir = configdir(3:end);

% loop through test cases and save mp4 animations for IP and Ref of the
% same test
for J = 1:length(configdir)
% read in test config    
configfile = importdata(['config/' configdir(J).name]);

%set properties
data = AllData{J};
name_IP = configfile.name_IP;
name_Ref = configfile.name_Ref;
minC = configfile.minC;
maxC = configfile.maxC;

tic;
%% IP

%setup figure and video object
h1 = figure;%('visible','off');
ax1 = gca;
c1 = colorbar;
c1.FontSize = 14;
vid1 = VideoWriter(name_IP,'MPEG-4');
vid1.FrameRate = 60;
open(vid1);

framenum = length(data);

for i = 1:3:framenum
    
    % imAlpha used to make tiles transparent when NaN
    imAlpha = ones(size(data{i,1}));
    imAlpha(isnan(data{i,1})) = 0;
    %plot
    imagesc(data{i,1},'AlphaData',imAlpha);
    %set plot properties
    set(ax1,'color',0*[1 1 1], 'XTick', xtick, 'YTick', ytick,'FontSize',14,'FontName','TrebuchetMS')
    axis image; colorbar; c1 = colorbar; c1.FontSize = 14; caxis(ax1,[minC maxC]);
    title(c1,'^\circC','FontName','TrebuchetMS')
    title('Temperature ( ^\circC ) Over Time','FontSize',14,'FontName','TrebuchetMS')
    xlabel('Tile Columns','FontName','TrebuchetMS')
    ylabel('Tile Rows','FontName','TrebuchetMS')
    
    %add Temps
    for x = 1:5
        for y = 1:6
            text(y-0.2,x,num2str(data{i,1}(x,y)),'FontSize',14,'FontName','TrebuchetMS');
        end
    end
    
    %draw and save frame
    drawnow;
    frame = getframe(h1);
    writeVideo(vid1,frame)

end

%close video object
close(vid1)
toc;
tic;
%% Ref Data

%setup figure and video object
h2 = figure('visible','off');
ax2 = gca;

set(ax2,'color',0*[1 1 1]);

vid2 = VideoWriter(name_Ref,'MPEG-4');
vid2.FrameRate = 60;
open(vid2);

framenum = length(data);

for i = 1:3:framenum
 
    % imAlpha used to make tiles transparent when NaN
    imAlpha = ones(size(data{i,2}));
    imAlpha(isnan(data{i,2})) = 0;
    %plot
    imagesc(data{i,2},'AlphaData',imAlpha);
    %set plot properties
    set(ax2,'color',0*[1 1 1], 'XTick', xtick, 'YTick', ytick, 'FontSize', 14,'FontName','TrebuchetMS')
    axis image; colorbar; c2 = colorbar; c2.FontSize = 14; caxis(ax2,[minC maxC]);
    title(c1,'^\circC')
    title('Temperature ( ^\circC ) Over Time','FontSize',14,'FontName','TrebuchetMS')
    xlabel('Tile Columns','FontName','TrebuchetMS')
    ylabel('Tile Rows','FontName','TrebuchetMS')
    % add Temps
    for x = 1:5
        for y = 1:6
            text(y-0.2,x,num2str(data{i,2}(x,y)),'FontSize',14,'FontName','TrebuchetMS');
        end
    end
    
    % draw and save frame
    drawnow;
    frame = getframe(h2);
    writeVideo(vid2,frame)

end
% close video object
close(vid2)
toc;

end