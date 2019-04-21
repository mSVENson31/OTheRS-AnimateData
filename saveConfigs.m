
%Amb
savefolder = 'mp4Files/';
configfolder = 'config/';
a.name_IP = [savefolder 'anim_amb_IP'];
a.name_Ref = [savefolder 'anim_amb_Ref'];
a.minC = 20;
a.maxC = 40;
save([configfolder 'Amb.mat'],'a')

%Black
b.name_IP = [savefolder 'anim_black_IP'];
b.name_Ref = [savefolder 'anim_black_Ref'];
b.minC = 20;
b.maxC = 40;
save([configfolder 'Black.mat'],'b')

%C
c.name_IP = [savefolder 'anim_C_IP'];
c.name_Ref = [savefolder 'anim_C_Ref'];
c.minC = -30;
c.maxC = 0;
save([configfolder 'C.mat'],'c')

%Emis
d.name_IP = [savefolder 'anim_Emis_IP'];
d.name_Ref = [savefolder 'anim_Emis_Ref'];
d.minC = 20;
d.maxC = 40;
save([configfolder 'Emis.mat'],'d')

%Filt
e.name_IP = [savefolder 'anim_Filt_IP'];
e.name_Ref = [savefolder 'anim_Filt_Ref'];
e.minC = 20;
e.maxC = 40;
save([configfolder 'Filt.mat'],'e')

%Grease
f.name_IP = [savefolder 'anim_Grease_IP'];
f.name_Ref = [savefolder 'anim_Grease_Ref'];
f.minC = 20;
f.maxC = 40;
save([configfolder 'Grease.mat'],'f')

%H
g.name_IP = [savefolder 'anim_H_IP'];
g.name_Ref = [savefolder 'anim_H_Ref'];
g.minC = 40;
g.maxC = 65;
save([configfolder 'H.mat'],'g')

%RawModel
h.name_IP = [savefolder 'anim_RawModel_IP'];
h.name_Ref = [savefolder 'anim_RawModel_Ref'];
h.minC = 20;
h.maxC = 60;
save([configfolder 'RawModel.mat'],'h')




