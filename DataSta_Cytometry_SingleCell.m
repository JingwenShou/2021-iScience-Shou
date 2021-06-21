Folder=11:40;
FolderNumber=length(Folder);

Color=1:9;
ColorNumber=length(Color);

PixelLength=500;
trimXY1=[1,1];
trimXY2=[500,500];

List=[]; % [#Folder,#SingleCell]
shiftedPearsonMatrix_2p=[];
shiftedPearsonMatrix_3p=[];
PMSize=[];
NucleusSize=[];

FilePath=uigetdir('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData');
FilePathDir=dir(FilePath);

for fd=Folder
    
    disp(['Now processing Folder No.',num2str(fd),' ...']);
    
    ImSet=zeros(PixelLength,PixelLength,ColorNumber);
    for co=Color
        ImSet(:,:,co)=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\',sprintf('%1d',co),'.tif']));
    end
    WholePMMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\PMMask.tif']));
    ArtifactMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\ArtifactMask.tif']));
    WholeNucleusMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\NucleusMask.tif']));
    
    BgList=extractBgList(ImSet,WholePMMask,ArtifactMask);
    
    for cell=1:5
        if ~exist([FilePath,'\',sprintf('%1d',fd),'\PMMask',sprintf('%1d',cell),'.tif'])==0            
            List=cat(2,List,[fd;cell]);
            disp(['cell ',num2str(cell)]);
            PMMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\PMMask',sprintf('%1d',cell),'.tif']));
            NucleusMask=WholeNucleusMask&PMMask;
            VectorSet=applyMask(ImSet,PMMask,ArtifactMask,trimXY1,trimXY2);
            
            shiftedPearsonMatrix_2p=cat(3,shiftedPearsonMatrix_2p,shiftedPearsonSta_2p(VectorSet,BgList));
            shiftedPearsonMatrix_3p=cat(4,shiftedPearsonMatrix_3p,shiftedPearsonSta_3p(VectorSet,BgList));
            PMSize=cat(2,PMSize,sum(PMMask(:)));
            NucleusSize=cat(2,NucleusSize,sum(NucleusMask(:)));
        end
    end

end

disp(['Total ',num2str(length(Folder)),' folders']);
disp(['Total ',num2str(length(List)),' cells']);
save([FilePath,'\DataSta_output_SingleCell_',num2str(Folder(1)),'to',num2str(Folder(end)),'.mat'],'Folder','Color','PixelLength','trimXY1','trimXY2','List','shiftedPearsonMatrix_2p','shiftedPearsonMatrix_3p','PMSize','NucleusSize','FilePath');

close all 
clear