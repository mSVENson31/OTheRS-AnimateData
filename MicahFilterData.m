close all; clear all; clc

load('RawData.Mat')


%% Process data to make relative and remove outliers

% ambient
Amb.IP(Amb.IP < -200) = NaN;
Amb.Ref(isoutlier(Amb.Ref(:,2:end),'mean')) = NaN;

AmbMat = cell(length(Amb.IP),2);

for i = 1:length(Amb.IP)
    
    AmbMat{i,1} = vec2mat(Amb.IP(i,2:end),6); %IP
    AmbMat{i,2} = vec2mat(Amb.Ref(i,2:end),6); %Ref

end

% black out
Black.IP(Black.IP < -200) = NaN;
Black.Ref(isoutlier(Black.Ref(:,2:end),'mean')) = NaN;

BlackMat = cell(length(Black.IP),2);

for i = 1:length(Black.IP)

    BlackMat{i,1} = vec2mat(Black.IP(i,2:end),6); %IP
    BlackMat{i,2} = vec2mat(Black.Ref(i,2:end),6); %Ref

end

% filtered
Filt.IP(Filt.IP < -200) = NaN;
Filt.Ref(isoutlier(Filt.Ref(:,2:end),'mean')) = NaN;

FiltMat = cell(length(Filt.IP),2);

for i = 1:length(Filt.IP)

    FiltMat{i,1} = vec2mat(Filt.IP(i,2:end),6); %IP
    FiltMat{i,2} = vec2mat(Filt.Ref(i,2:end),6); %Ref

end

% emissivity
Emis.IP(Emis.IP < -200) = NaN;
Emis.Ref(isoutlier(Emis.Ref(:,2:end),'mean')) = NaN;

EmisMat = cell(length(Emis.IP),2);

for i = 1:length(Emis.IP)

    EmisMat{i,1} = vec2mat(Emis.IP(i,2:end),6); %IP
    EmisMat{i,2} = vec2mat(Emis.Ref(i,2:end),6); %Ref

end

% grease
Grease.IP(Grease.IP < -200) = NaN;
Grease.Ref(isoutlier(Grease.Ref(:,2:end),'mean')) = NaN;

GreaseMat = cell(length(Grease.IP),2);

for i = 1:length(Grease.IP)

    GreaseMat{i,1} = vec2mat(Grease.IP(i,2:end),6); %IP
    GreaseMat{i,2} = vec2mat(Grease.Ref(i,2:end),6); %Ref

end


%%%%%%%%%%%%%%%%%%%%%%
% chamber cold
C.IP(C.IP < -200) = NaN;
C.Ref(isoutlier(C.Ref(:,2:end),'mean')) = NaN;

CMat = cell(length(C.IP),2);

for i = 1:length(C.IP)

    CMat{i,1} = vec2mat(C.IP(i,2:end),6); %IP
    CMat{i,2} = vec2mat(C.Ref(i,2:end),6); %Ref

end


% chamber hot
H.IP(H.IP < -200) = NaN;
H.Ref(isoutlier(H.Ref(:,2:end),'mean')) = NaN;

HMat = cell(length(H.IP),2);

for i = 1:length(H.IP)

    HMat{i,1} = vec2mat(H.IP(i,2:end),6); %IP
    HMat{i,2} = vec2mat(H.Ref(i,2:end),6); %Ref

end



%%%%%%%%%%%%%%%%%%%%%%
% ambient model raw
RawModel.IP(RawModel.IP < -200) = NaN;
RawModel.Ref(isoutlier(RawModel.Ref(:,2:end),'mean')) = NaN;

RawModelMat = cell(length(RawModel.IP),2);

for i = 1:length(RawModel.IP)

    RawModelMat{i,1} = vec2mat(RawModel.IP(i,2:end),6); %IP
    RawModelMat{i,2} = vec2mat(RawModel.Ref(i,2:end),6); %Ref

end


% ambient model predict



save('micahData.mat','AmbMat', 'BlackMat', 'EmisMat', 'FiltMat', 'GreaseMat', 'CMat', 'HMat', 'RawModelMat')






