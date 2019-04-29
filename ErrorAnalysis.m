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

%absolute difference between amb and IP
AbsDiff = cell(1,8);

for i = 1:8
    for j = 1:length(AllData{i})
        
        AbsDiff{i}(:,:,j) = abs(AllData{i}{j,1} - AllData{i}{j,2});
        
    end
end

% error per tile
TimeAvgError = cell(1,8);
TimeStdError = cell(1,8);
for z = 1:8
    
    TimeAvgError{z} = nanmean(AbsDiff{z},3);
    TimeStdError{z} = std(AbsDiff{z},0,3,'omitnan');
    
end

save('ErrorPerTile.mat','TimeAvgError','TimeStdError')


        