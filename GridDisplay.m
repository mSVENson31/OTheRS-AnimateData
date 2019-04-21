close all; clear all; clc
%% Read in Data
answer = questdlg('How are you loading data?','Data Import','Read .txt files','Read Workspace','Read Workspace');
switch answer
    case 'Read .txt files'
        %%%%%%%%%%%%%%%%%%%%%%
        % Read Ambient
        % Sixth test of ambient
        FID = fopen('Ambient Test Results/ambient_refdata6.txt');
        Amb.Ref = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        FID = fopen('Ambient Test Results/ambient_IPdata6.txt');
        Amb.IP = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);

        % Read Blackout
        FID = fopen('Blackout Test Results/blackout_refdata2.txt');
        Black.Ref = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        FID = fopen('Blackout Test Results/blackout_IPdata2.txt');
        Black.IP = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);

        % Read Filtered
        FID = fopen('Accuracy Improvements/420_REFDATAtest1.txt');
        Filt.Ref = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        FID = fopen('Accuracy Improvements/420_IPtest1.txt');
        Filt.IP = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        
        % Read Emissivity
        FID = fopen('Accuracy Improvements/420_REFDATAtest2.txt');
        Emis.Ref = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        FID = fopen('Accuracy Improvements/420_IPtest2.txt');
        Emis.IP = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        
        % Read Grease
        FID = fopen('Accuracy Improvements/420_REFDATAtest3.txt');
        Grease.Ref = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        FID = fopen('Accuracy Improvements/420_IPtest3.txt');
        Grease.IP = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);

        %%%%%%%%%%%%%%%%%%%%%%
        % Read Hot Chamber
        FID = fopen('Chamber Test Results/chamber_reftest_HOT.txt');
        H.Ref = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        FID = fopen('Chamber Test Results/chamber_IPtest_HOT.txt');
        H.IP = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);

        % Read Cold Chamber
        FID = fopen('Chamber Test Results/chamber_reftest_COLD.txt');
        C.Ref = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        FID = fopen('Chamber Test Results/chamber_IPtest_COLD.txt');
        C.IP = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);

        %%%%%%%%%%%%%%%%%%%%%%
        % Read Model Raw - Ambient
        FID = fopen('Model Validation/420_REFDATAtest4.txt');
        RawModel.Ref = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        FID = fopen('Model Validation/420_IPtest4.txt');
        RawModel.IP = cell2mat(textscan(FID, '%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]', 'HeaderLines', 3));
        fclose(FID);
        % Read Model Predict - Ambient
        
        
    case 'Read Workspace'
        load('RawData.Mat')
    case ""
        errordlg('Choose one')
end


%% Proccess data to make relative and remove outliers

% ambient
Amb.IP(Amb.IP < -200) = NaN;
Amb.Ref(isoutlier(Amb.Ref(:,2:end),'mean')) = NaN;
amb_end = 1680;
ambIP = zeros(5,6,3); ambRef = zeros(5,6,3); % preallocate
    % IP
    ambIP(1,1:6,1) = Amb.IP(1,2:7); ambIP(1,1:6,2) = Amb.IP(amb_end/2,2:7); ambIP(1,1:6,3) = Amb.IP(amb_end,2:7);
    ambIP(2,1:6,1) = Amb.IP(1,8:13); ambIP(2,1:6,2) = Amb.IP(amb_end/2,8:13); ambIP(2,1:6,3) = Amb.IP(amb_end,8:13);
    ambIP(3,1:6,1) = Amb.IP(1,14:19); ambIP(3,1:6,2) = Amb.IP(amb_end/2,14:19); ambIP(3,1:6,3) = Amb.IP(amb_end,14:19);
    ambIP(4,1:6,1) = Amb.IP(1,20:25); ambIP(4,1:6,2) = Amb.IP(amb_end/2,20:25); ambIP(4,1:6,3) = Amb.IP(amb_end,20:25);
    ambIP(5,1:6,1) = Amb.IP(1,26:31); ambIP(5,1:6,2) = Amb.IP(amb_end/2,26:31); ambIP(5,1:6,3) = Amb.IP(amb_end,26:31);

    % Ref
    ambRef(1,1:6,1) = Amb.Ref(1,2:7); ambRef(1,1:6,2) = Amb.Ref(amb_end/2,2:7); ambRef(1,1:6,3) = Amb.Ref(amb_end,2:7);
    ambRef(2,1:6,1) = Amb.Ref(1,8:13); ambRef(2,1:6,2) = Amb.Ref(amb_end/2,8:13); ambRef(2,1:6,3) = Amb.Ref(amb_end,8:13);
    ambRef(3,1:6,1) = Amb.Ref(1,14:19); ambRef(3,1:6,2) = Amb.Ref(amb_end/2,14:19); ambRef(3,1:6,3) = Amb.Ref(amb_end,14:19);
    ambRef(4,1:6,1) = Amb.Ref(1,20:25); ambRef(4,1:6,2) = Amb.Ref(amb_end/2,20:25); ambRef(4,1:6,3) = Amb.Ref(amb_end,20:25);
    ambRef(5,1:6,1) = Amb.Ref(1,26:31); ambRef(5,1:6,2) = Amb.Ref(amb_end/2,26:31); ambRef(5,1:6,3) = Amb.Ref(amb_end,26:31);
% black out
Black.IP(Black.IP < -200) = NaN;
Black.Ref(isoutlier(Black.Ref(:,2:end),'mean')) = NaN;
black_end = 956;
blackIP = zeros(5,6,3); blackRef = zeros(5,6,3); % preallocate
    % IP
    blackIP(1,1:6,1) = Black.IP(1,2:7); blackIP(1,1:6,2) = Black.IP(black_end/2,2:7); blackIP(1,1:6,3) = Black.IP(black_end,2:7);
    blackIP(2,1:6,1) = Black.IP(1,8:13); blackIP(2,1:6,2) = Black.IP(black_end/2,8:13); blackIP(2,1:6,3) = Black.IP(black_end,8:13);
    blackIP(3,1:6,1) = Black.IP(1,14:19); blackIP(3,1:6,2) = Black.IP(black_end/2,14:19); blackIP(3,1:6,3) = Black.IP(black_end,14:19);
    blackIP(4,1:6,1) = Black.IP(1,20:25); blackIP(4,1:6,2) = Black.IP(black_end/2,20:25); blackIP(4,1:6,3) = Black.IP(black_end,20:25);
    blackIP(5,1:6,1) = Black.IP(1,26:31); blackIP(5,1:6,2) = Black.IP(black_end/2,26:31); blackIP(5,1:6,3) = Black.IP(black_end,26:31);

    % Ref
    blackRef(1,1:6,1) = Black.Ref(1,2:7); blackRef(1,1:6,2) = Black.Ref(black_end/2,2:7); blackRef(1,1:6,3) = Black.Ref(black_end,2:7);
    blackRef(2,1:6,1) = Black.Ref(1,8:13); blackRef(2,1:6,2) = Black.Ref(black_end/2,8:13); blackRef(2,1:6,3) = Black.Ref(black_end,8:13);
    blackRef(3,1:6,1) = Black.Ref(1,14:19); blackRef(3,1:6,2) = Black.Ref(black_end/2,14:19); blackRef(3,1:6,3) = Black.Ref(black_end,14:19);
    blackRef(4,1:6,1) = Black.Ref(1,20:25); blackRef(4,1:6,2) = Black.Ref(black_end/2,20:25); blackRef(4,1:6,3) = Black.Ref(black_end,20:25);
    blackRef(5,1:6,1) = Black.Ref(1,26:31); blackRef(5,1:6,2) = Black.Ref(black_end/2,26:31); blackRef(5,1:6,3) = Black.Ref(black_end,26:31);
% filtered

% emissivity

% grease

%%%%%%%%%%%%%%%%%%%%%%
% chamber cold
C.IP(C.IP < -200) = NaN;
C.Ref(isoutlier(C.Ref(:,2:end),'mean')) = NaN;
C_end = 636;
CIP = zeros(5,6,3); CRef = zeros(5,6,3); % preallocate
    % IP
    CIP(1,1:6,1) = C.IP(1,2:7); CIP(1,1:6,2) = C.IP(C_end/2,2:7); CIP(1,1:6,3) = C.IP(C_end,2:7);
    CIP(2,1:6,1) = C.IP(1,8:13); CIP(2,1:6,2) = C.IP(C_end/2,8:13); CIP(2,1:6,3) = C.IP(C_end,8:13);
    CIP(3,1:6,1) = C.IP(1,14:19); CIP(3,1:6,2) = C.IP(C_end/2,14:19); CIP(3,1:6,3) = C.IP(C_end,14:19);
    CIP(4,1:6,1) = C.IP(1,20:25); CIP(4,1:6,2) = C.IP(C_end/2,20:25); CIP(4,1:6,3) = C.IP(C_end,20:25);
    CIP(5,1:6,1) = C.IP(1,26:31); CIP(5,1:6,2) = C.IP(C_end/2,26:31); CIP(5,1:6,3) = C.IP(C_end,26:31);

    % Ref
    CRef(1,1:6,1) = C.Ref(1,2:7); CRef(1,1:6,2) = C.Ref(C_end/2,2:7); CRef(1,1:6,3) = C.Ref(C_end,2:7);
    CRef(2,1:6,1) = C.Ref(1,8:13); CRef(2,1:6,2) = C.Ref(C_end/2,8:13); CRef(2,1:6,3) = C.Ref(C_end,8:13);
    CRef(3,1:6,1) = C.Ref(1,14:19); CRef(3,1:6,2) = C.Ref(C_end/2,14:19); CRef(3,1:6,3) = C.Ref(C_end,14:19);
    CRef(4,1:6,1) = C.Ref(1,20:25); CRef(4,1:6,2) = C.Ref(C_end/2,20:25); CRef(4,1:6,3) = C.Ref(C_end,20:25);
    CRef(5,1:6,1) = C.Ref(1,26:31); CRef(5,1:6,2) = C.Ref(C_end/2,26:31); CRef(5,1:6,3) = C.Ref(C_end,26:31);
% chamber hot
H.IP(H.IP < -200) = NaN;
H.Ref(isoutlier(H.Ref(:,2:end),'mean')) = NaN;
H_end = 1698;
HIP = zeros(5,6,3); HRef = zeros(5,6,3); % preallocate
    % IP
    HIP(1,1:6,1) = H.IP(1,2:7); HIP(1,1:6,2) = H.IP(H_end/2,2:7); HIP(1,1:6,3) = H.IP(H_end,2:7);
    HIP(2,1:6,1) = H.IP(1,8:13); HIP(2,1:6,2) = H.IP(H_end/2,8:13); HIP(2,1:6,3) = H.IP(H_end,8:13);
    HIP(3,1:6,1) = H.IP(1,14:19); HIP(3,1:6,2) = H.IP(H_end/2,14:19); HIP(3,1:6,3) = H.IP(H_end,14:19);
    HIP(4,1:6,1) = H.IP(1,20:25); HIP(4,1:6,2) = H.IP(H_end/2,20:25); HIP(4,1:6,3) = H.IP(H_end,20:25);
    HIP(5,1:6,1) = H.IP(1,26:31); HIP(5,1:6,2) = H.IP(H_end/2,26:31); HIP(5,1:6,3) = H.IP(H_end,26:31);

    % Ref
    HRef(1,1:6,1) = H.Ref(1,2:7); HRef(1,1:6,2) = H.Ref(H_end/2,2:7); HRef(1,1:6,3) = H.Ref(H_end,2:7);
    HRef(2,1:6,1) = H.Ref(1,8:13); HRef(2,1:6,2) = H.Ref(H_end/2,8:13); HRef(2,1:6,3) = H.Ref(H_end,8:13);
    HRef(3,1:6,1) = H.Ref(1,14:19); HRef(3,1:6,2) = H.Ref(H_end/2,14:19); HRef(3,1:6,3) = H.Ref(H_end,14:19);
    HRef(4,1:6,1) = H.Ref(1,20:25); HRef(4,1:6,2) = H.Ref(H_end/2,20:25); HRef(4,1:6,3) = H.Ref(H_end,20:25);
    HRef(5,1:6,1) = H.Ref(1,26:31); HRef(5,1:6,2) = H.Ref(H_end/2,26:31); HRef(5,1:6,3) = H.Ref(H_end,26:31);


%%%%%%%%%%%%%%%%%%%%%%
% ambient model raw

% ambient model predict


%% Save the workspace if needed
a2 = questdlg('Save Workspace?','MAT Files','Yes','No','No');
switch a2
    case 'Yes'
        save('RawData','Amb','Black','C','Emis','Filt','Grease','H','RawModel')
    case 'No'
        fprintf('mat files not saved \n')
end

