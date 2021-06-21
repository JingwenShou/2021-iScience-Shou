Folder=31;
FolderNumber=length(Folder);

Color=1:4;
ColorNumber=length(Color);

PixelLength=500;
trimXY1=[1,1];
trimXY2=[500,500];

FilePath=uigetdir('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterVBM3D\LD motion\DiffAvg');
FilePathDir=dir(FilePath);

for fd=Folder
    
    disp(['Now processing Folder No.',num2str(fd),' ...']);
    
    ImSet=zeros(PixelLength,PixelLength,ColorNumber);
    ImSet(:,:,1)=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\',sprintf('%1d',fd),'-5Avg.tif']));
    ImSet(:,:,2)=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\',sprintf('%1d',fd),'-5DiffMaxProj.tif']));
    ImSet(:,:,3)=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\',sprintf('%1d',fd),'-6Avg.tif']));
    ImSet(:,:,4)=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\',sprintf('%1d',fd),'-6DiffMaxProj.tif']));
    PMMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\PMMask.tif']));
    ArtifactMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\ArtifactMask.tif']));
    NucleusMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\NucleusMask.tif']));
    WholePMMask=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\WholePMMask.tif']));
    RPMDMap=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\RelativePMDistanceMap.tif']));
    VectorSet=applyMask(ImSet,PMMask,ArtifactMask,trimXY1,trimXY2);
    VectorRPMD=applyMask(RPMDMap,PMMask,ArtifactMask,trimXY1,trimXY2);
    BgList=extractBgList(ImSet,WholePMMask,ArtifactMask);
    
    for co=1:ColorNumber
    	VectorSet(:,co)=VectorSet(:,co)-BgList(co);
    end
    gap=0:(1.0/25):1;
    Dis=zeros(length(BgList),length(gap)-1);
    MaxPixel=zeros(length(BgList),length(gap)-1);
    for co=1:length(BgList)
        VectorCo=VectorSet(:,co);
        for gapFlag=1:length(gap)-1
            VectorCoFilter=VectorCo(find((VectorRPMD>=gap(gapFlag))&(VectorRPMD<gap(gapFlag+1))));
            Dis(co,gapFlag)=sum(VectorCoFilter);
            MaxPixel(co,gapFlag)=max(VectorCoFilter);
        end
    end
    Seq={'Lyso','LD',};
    for co=1:(length(BgList)/2)
        Dis(co,:)=Dis(co,:)./max(Dis(co,:));
        Dis(co*2,:)=Dis(co*2,:)./max(Dis(co*2,:));
        MaxPixel(co,:)=MaxPixel(co,:)./max(MaxPixel(co,:));
        MaxPixel(co*2,:)=MaxPixel(co*2,:)./max(MaxPixel(co*2,:));
        fig=figure;
        hold on;
        b=bar(0+gap(2)/2:gap(2):1-gap(2)/2,[Dis(co,:);Dis(co*2,:)],'EdgeColor','none');
        %scatter(0+gap(2)/2:gap(2):1-gap(2)/2,MaxPixel(co,:),'g');
        %scatter(0+gap(2)/2:gap(2):1-gap(2)/2,MaxPixel(co*2,:),'r');
        box off;
        b(1).FaceColor=[0 1 0];
        b(2).FaceColor=[1 0 0];
        xlim([-0.1 1.1]);
        ylim([0 1.1]);
        title(Seq(co));
        xlabel('Relative distance to PM');
        ylabel('Normalized value');
        legend('Location','northwest');
        legend({'Avg','Diff.MaxProj'});
        waitforbuttonpress;
    end
    
end


