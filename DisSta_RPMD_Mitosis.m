Folder=48;
FolderNumber=length(Folder);

Color=1:9;
ColorNumber=length(Color);

PixelLength=500;
trimXY1=[1,1];
trimXY2=[500,500];

FilePath=uigetdir('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterVBM3D\Mitosis');
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
    RPMDMap=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\RelativePMDistanceMap.tif']));
    VectorSet=applyMask(ImSet,PMMask,ArtifactMask,trimXY1,trimXY2);
    VectorRPMD=applyMask(RPMDMap,PMMask,ArtifactMask,trimXY1,trimXY2);
    BgList=extractBgList(ImSet,WholePMMask,ArtifactMask);
    
    for co=1:ColorNumber
        VectorSet(:,co)=VectorSet(:,co)-BgList(co);
    end
    gap=0:(1.0/50):1;
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
    Seq={'2PFL-Nucleus','Nucleus','PM','Tubulin','Actin','Mito','Lyso','LD','ER'};
    for co=1:length(BgList)
        Dis(co,:)=Dis(co,:)./max(Dis(co,:));
        MaxPixel(co,:)=MaxPixel(co,:)./max(MaxPixel(co,:));
%         fig=figure;
%         hold on;
%         bar(0+gap(2)/2:gap(2):1-gap(2)/2,Dis(co,:));
%         scatter(0+gap(2)/2:gap(2):1-gap(2)/2,MaxPixel(co,:));
%         box off;
%         xlim([-0.1 1.1]);
%         ylim([0 1.1]);
%         title(Seq(co));
%         xlabel('Relative distance to PM');
%         ylabel('Normalized');
%         waitforbuttonpress;
    end
    colorSetting=[0 1 0; 1 0 1; 0 1 1; 1 0 0; 1 1 0; 0 0 1];
    coPlot=4:9;
    for co=coPlot
            scatterbar3(ones(1,length(gap)-1).*(co*2)-0.02,0+gap(2)/2:gap(2):1-gap(2)/2,Dis(co,:),gap(2)*0.75,colorSetting(co-coPlot(1)+1,:));
            hold on;
            scatter3(ones(1,length(gap)-1).*(co*2)+0.02,0+gap(2)/2:gap(2):1-gap(2)/2,MaxPixel(co,:),'MarkerFaceColor',colorSetting(co-coPlot(1)+1,:).*0.5+[1 1 1].*0.5,'MarkerEdgeColor',[0 0 0]);
    end
    set(gcf,'renderer','zbuffer');
    box off;
    xlim([3.9*2 9.1*2]);
    xticks((4:9).*2);
    xticklabels(Seq(4:9));
    %ylabel('Relative distance to PM');
    zlabel('Normalized value');
    view(20,35);
    
end


