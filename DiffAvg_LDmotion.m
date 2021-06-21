Folder=31:40;
FolderNumber=length(Folder);

Color=1:6;
ColorNumber=length(Color);

PixelLength=500;

FilePath=uigetdir('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData');
FilePathDir=dir(FilePath);

ImSet=zeros(PixelLength,PixelLength,ColorNumber,FolderNumber);

for fd=Folder    
  
    for co=Color
        ImSet(:,:,co-Color(1)+1,fd-Folder(1)+1)=im2double(imread([FilePath,'\',sprintf('%1d',fd),'\',sprintf('%1d',co),'.tif']));
    end

end

AvgSet=mean(ImSet,4);
DiffSet=zeros(PixelLength,PixelLength,ColorNumber,FolderNumber);
for fd=1:FolderNumber
    DiffSet(:,:,:,fd)=ImSet(:,:,:,fd)-AvgSet;
end
DiffMaxProjSet=max(DiffSet,[],4);

mkdir([FilePath,'\DiffAvg']);
for fd=Folder    
  
    mkdir([FilePath,'\DiffAvg\',sprintf('%1d',fd)]);
    for co=Color
        imwrite(DiffSet(:,:,co-Color(1)+1,fd-Folder(1)+1),[FilePath,'\DiffAvg\',sprintf('%1d',fd),'\',sprintf('%1d',fd),'-',sprintf('%1d',co),'Diff.tif']);
        imwrite(DiffMaxProjSet(:,:,co-Color(1)+1),[FilePath,'\DiffAvg\',sprintf('%1d',fd),'\',sprintf('%1d',fd),'-',sprintf('%1d',co),'DiffMaxProj.tif']);
        imwrite(AvgSet(:,:,co-Color(1)+1),[FilePath,'\DiffAvg\',sprintf('%1d',fd),'\',sprintf('%1d',fd),'-',sprintf('%1d',co),'Avg.tif']);
    end

end

close all 
clear