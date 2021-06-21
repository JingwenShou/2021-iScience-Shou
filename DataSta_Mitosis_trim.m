Folder=41:48;
FolderNumber=length(Folder);

Color=1:9;
ColorNumber=length(Color);

PixelLength=500;
trimXY1=[228,234];
trimXY2=[228+70-1,234+38-1];

shiftedPearsonMatrix_2p=zeros(ColorNumber,ColorNumber,FolderNumber);
shiftedPearsonMatrix_3p=zeros(ColorNumber,ColorNumber,ColorNumber,FolderNumber);
%PMSize=Folder;
%NucleusSize=Folder;

FilePath=uigetdir('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData');
FilePathDir=dir(FilePath);

for fd=Folder
    
    disp(['Now processing Folder No.',num2str(fd),' ...']);
    
    ImSet=zeros(PixelLength,PixelLength,ColorNumber);
    for co=Color
        ImSet(:,:,co)=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\',sprintf('%1d',co),'.tif']));
    end
    PMMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\PMMask.tif']));
    ArtifactMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\ArtifactMask.tif']));
    NucleusMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\NucleusMask.tif']));
    WholePMMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\WholePMMask.tif']));
    
    VectorSet=applyMask(ImSet,PMMask,ArtifactMask,trimXY1,trimXY2);
    BgList=extractBgList(ImSet,WholePMMask,ArtifactMask);
    shiftedPearsonMatrix_2p(:,:,fd-Folder(1)+1)=shiftedPearsonSta_2p(VectorSet,BgList);
    shiftedPearsonMatrix_3p(:,:,:,fd-Folder(1)+1)=shiftedPearsonSta_3p(VectorSet,BgList);
    
    %PMSize(fd-Folder(1)+1)=sum(PMMask(:));
    %NucleusSize(fd-Folder(1)+1)=sum(NucleusMask(:));

end

save([FilePath,'\DataSta_output_',num2str(Folder(1)),'to',num2str(Folder(end)),'_trim.mat'],'Folder','Color','PixelLength','trimXY1','trimXY2','shiftedPearsonMatrix_2p','shiftedPearsonMatrix_3p','PMSize','NucleusSize','FilePath');

close all 
clear