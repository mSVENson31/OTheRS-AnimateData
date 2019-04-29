clear all; close all; clc;
tic;
% Read in Animation Frames and store in CellArray
load('ErrorPerTile.mat');

% set x and y ticks
xtick = [1 2 3 4 5 6];
ytick = [1 2 3 4 5];

%figures are saved with test names
testName_vec = {'C','Emis','Filt','Grease','H','RawModel','Amb','Black'};

cmap = colormap('parula');
for i = 1:8
avgerror = TimeAvgError{i};
stderror = TimeStdError{i};

%% Average Error

%setup figure and video object
h1 = figure('visible','off');
h1.InvertHardcopy = 'off';
ax1 = gca;
c1 = colorbar;
c1.FontSize = 14;

%plot
imagesc(avgerror);
%set plot properties
set(ax1,'color',0*[1 1 1], 'XTick', xtick, 'YTick', ytick,'FontSize',14,'FontName','TrebuchetMS')
axis image; colorbar; c1 = colorbar; c1.FontSize = 14; %caxis(ax1,[minC maxC]);
colormap(ax1,cmap)
title(c1,'^\circC','FontName','TrebuchetMS')
title('Avg Temperature Difference ( ^\circC ) Over Time','FontSize',14,'FontName','TrebuchetMS')
xlabel('Tile Columns','FontName','TrebuchetMS')
ylabel('Tile Rows','FontName','TrebuchetMS')

%add Temps
for x = 1:5
    for y = 1:6
        text(y-0.2,x,num2str(round(avgerror(x,y),3)),'FontSize',14,'FontName','TrebuchetMS');
    end
end

%draw and save frame
drawnow;

%% Std Error

%setup figure and video object
h2 = figure('visible','off');
h2.InvertHardcopy = 'off';
ax1 = gca;
c1 = colorbar;
c1.FontSize = 14;

%plot
imagesc(stderror);
%set plot properties
set(ax1,'color',0*[1 1 1], 'XTick', xtick, 'YTick', ytick,'FontSize',14,'FontName','TrebuchetMS')
axis image; colorbar; c1 = colorbar; c1.FontSize = 14; %caxis(ax1,[minC maxC]);
colormap(ax1,cmap)
title(c1,'^\circC','FontName','TrebuchetMS')
title('Std of Temperature Difference ( ^\circC ) Over Time','FontSize',14,'FontName','TrebuchetMS')
xlabel('Tile Columns','FontName','TrebuchetMS')
ylabel('Tile Rows','FontName','TrebuchetMS')

%add Temps
for x = 1:5
    for y = 1:6
        text(y-0.2,x,num2str(round(stderror(x,y),3)),'FontSize',14,'FontName','TrebuchetMS');
    end
end

%draw and save frame
drawnow;

saveas(h1, sprintf('%s/ErrorFigs/errorPerTile/avgerror_%s.png',pwd,testName_vec{i}),'png')
saveas(h2, sprintf('%s/ErrorFigs/errorPerTile/stderror_%s.png',pwd,testName_vec{i}),'png')

end




Weights = [  0 , 120, 195, 192, 121,   0;...
            782, 472, 230, 253, 494,  875;...
           1119, 488, 269, 270, 527, 1173;...
           1203, 535, 280, 286, 585, 1182;...
            992, 485, 273, 258, 510,  932];

        
        
%setup figure and video object
h3 = figure;%('visible','off');
h2.InvertHardcopy = 'off';
ax1 = gca;
c1 = colorbar;
c1.FontSize = 14;

%plot
imagesc(Weights);
%set plot properties
set(ax1,'color',0*[1 1 1], 'XTick', xtick, 'YTick', ytick,'FontSize',14,'FontName','TrebuchetMS')
axis image; colorbar; c1 = colorbar; c1.FontSize = 14; %caxis(ax1,[minC maxC]);
colormap(ax1,cmap)
title(c1,'^\circC','FontName','TrebuchetMS')
title('Number of Pixels Per Tile','FontSize',14,'FontName','TrebuchetMS')
xlabel('Tile Columns','FontName','TrebuchetMS')
ylabel('Tile Rows','FontName','TrebuchetMS')

%add Temps
for x = 1:5
    for y = 1:6
        text(y-0.2,x,num2str(round(Weights(x,y),3)),'FontSize',14,'FontName','TrebuchetMS');
    end
end

%draw and save frame
drawnow;

saveas(h3, sprintf('%s/ErrorFigs/errorPerTile/numPxPerTile.png',pwd),'png')

toc;
