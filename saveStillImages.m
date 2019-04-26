clear all; close all; clc;


% set x and y ticks
xtick = [1 2 3 4 5 6];
ytick = [1 2 3 4 5];

%load Coatings test data
load('Coatings.mat')

% ambient
Black.IP(Black.IP < -198) = NaN;
Black.IP(Black.IP == 0) = NaN;
Black.Ref(isoutlier(Black.Ref(:,2:end),'mean')) = NaN;

BlackMat = cell(2,1);

for i = 1:2%length(Black.Ref)
    

    BlackMat{i,1} = vec2mat(Black.IP(i,2:end),6); %IP

    BlackMat{i,2} = vec2mat(Black.Ref(i,2:end),6); %Ref

end

% ambient
Blue.IP(Blue.IP < -198) = NaN;
Blue.IP(Blue.IP == 0) = NaN;
Blue.Ref(isoutlier(Blue.Ref(:,2:end),'mean')) = NaN;

BlueMat = cell(2,1);

for i = 1:2%length(Blue.Ref)
    
    BlueMat{i,1} = vec2mat(Blue.IP(i,2:end),6); %IP

    BlueMat{i,2} = vec2mat(Blue.Ref(i,2:end),6); %Ref

end


%title_vec = {'IP: Black paper at t = 0','Ref: Black paper at t = 0','IP: Black paper at t = 1000','Ref: Black paper at t = 1000'};
title_vec = {'IP: Blue paper at t = 0','Ref: Blue paper at t = 0','IP: Blue paper at t = 1000','Ref: Blue paper at t = 1000'};

%save_vec = {'black_IP_0','black_Ref_0','black_IP_1000','black_Ref_1000'};
save_vec = {'blue_IP_0','blue_Ref_0','blue_IP_1000','blue_Ref_1000'};

% read in test config    
%set properties

data = {BlueMat{1,:}, BlueMat{2,:}}';

minC = 20;
maxC = 40;
tic;


framenum = length(data);

for i = 1:framenum
%setup figure and video object
h1 = figure;%('visible','off');
ax1 = gca;
c1 = colorbar;
c1.FontSize = 14;


    
    % imAlpha used to make tiles transparent when NaN
    imAlpha = ones(size(data{i,1}));
    imAlpha(isnan(data{i,1})) = 0;
    %plot
    imagesc(data{i,1},'AlphaData',imAlpha);
    %set plot properties
    set(ax1,'color',0*[1 1 1], 'XTick', xtick, 'YTick', ytick,'FontSize',14,'FontName','TrebuchetMS')
    axis image; colorbar; c1 = colorbar; c1.FontSize = 14; caxis(ax1,[minC maxC]);
    title(c1,'^\circC','FontName','TrebuchetMS')
    title(title_vec{i},'FontSize',14,'FontName','TrebuchetMS')
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
    %saveas(h1,['figs/' save_vec{i}],'png')

end

