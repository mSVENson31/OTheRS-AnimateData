clear all; close all; clc;
tic;
load('micahData.mat');
tic;
% Change this stuff
data = ambMat;
name_IP = 'anim_amb_IP';
name_Ref = 'anim_amb_Ref';
minC = 20;
maxC = 40;

h1 = figure;%('visible','off');
ax1 = gca;

axis image % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif';
framenum = length(data);

for i = 1:3:framenum
 
    imAlpha = ones(size(data{i,1}));
    imAlpha(isnan(data{i,1})) = 0;
    imagesc(data{i,1},'AlphaData',imAlpha);
    set(ax1,'color',0*[1 1 1]);
    axis off; axis image; colorbar; caxis(ax1,[minC maxC]);
    drawnow;
    
      % Capture the plot as an image 
      frame = getframe(h1); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
end
  toc;
%%
% % % 
% % % %% IP
% % % 
% % % h1 = figure('visible','off');
% % % ax1 = gca;
% % % vid1 = VideoWriter(name_IP,'MPEG-4');
% % % vid1.FrameRate = 60;
% % % open(vid1);
% % % 
% % % framenum = length(data);
% % % 
% % % for i = 1:framenum
% % %  
% % %     imAlpha = ones(size(data{i,1}));
% % %     imAlpha(isnan(data{i,1})) = 0;
% % %     imagesc(data{i,1},'AlphaData',imAlpha);
% % %     set(ax1,'color',0*[1 1 1]);
% % %     axis off; axis image; colorbar; caxis(ax1,[minC maxC]);
% % %     drawnow;
% % %     frame = getframe(h1);
% % %     writeVideo(vid1,frame)
% % % 
% % % end
% % % 
% % % close(vid1)
% % % toc;
% % % tic;
% % % %% Ref Data
% % % h2 = figure('visible','off');
% % % ax2 = gca;
% % % vid2 = VideoWriter(name_Ref,'MPEG-4');
% % % open(vid2);
% % % 
% % % framenum = length(data);
% % % 
% % % for i = 1:framenum
% % %  
% % %     imAlpha = ones(size(data{i,2}));
% % %     imAlpha(isnan(data{i,2})) = 0;
% % %     imagesc(data{i,2},'AlphaData',imAlpha);
% % %     set(ax2,'color',0*[1 1 1]);
% % %     axis off; axis image; colorbar; caxis(ax2,[minC maxC]);
% % %     drawnow;
% % %     frame = getframe(h2);
% % %     writeVideo(vid2,frame)
% % % 
% % % end
% % % 
% % % close(vid2)
% % % toc;