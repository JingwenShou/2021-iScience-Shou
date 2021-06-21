function [ RelativePMDistanceMap ] = genRelativePMDistanceMap( PMMask, NucleusMask )
%Input Image should be double values normalized to 0~1 (by using 'im2double(imread(FilePath));')

PixelLength=size(PMMask,1);
rePMMask=~PMMask;

RelativePMDistanceMap=zeros(PixelLength,PixelLength);

for x=1:PixelLength
    for y=1:PixelLength
                
        Dis2xy=zeros(PixelLength,PixelLength);
        for i=1:PixelLength
            for j=1:PixelLength
                Dis2xy(i,j)=sqrt((i-x)^2+(j-y)^2);
            end
        end               
        
        NucleusDistance=Dis2xy.*NucleusMask+(NucleusMask-1);
        NucleusDistance=NucleusDistance(:);
        NucleusDistance(find(NucleusDistance<-0.5))=[];
        NucleusDistance=min(NucleusDistance);
        
        PMDistance=Dis2xy.*rePMMask+(rePMMask-1);
        PMDistance=PMDistance(:);
        PMDistance(find(PMDistance<-0.5))=[];
        PMDistance=min(PMDistance);
        
        RelativePMDistanceMap(x,y)=PMDistance/(NucleusDistance+PMDistance);           
             
    end
end

end