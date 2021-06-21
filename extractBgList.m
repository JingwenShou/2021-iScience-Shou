function [ BgList ] = extractBgList( ImSet, PMMask, ArtifactMask )
%Input Image should be double values normalized to 0~1 (by using 'im2double(imread(FilePath));')

Mask=(~PMMask)&(~ArtifactMask);
tempImSet=ImSet;
colorNumber=size(ImSet,3);
for co=1:colorNumber
    tempImSet(:,:,co)=ImSet(:,:,co).*Mask+(Mask-1);
end

VectorSet=[];
for co=1:colorNumber
    tempVector=tempImSet(:,:,co);
    tempVector=tempVector(:);
    tempVector(find(tempVector<-0.5))=[];
    VectorSet=[VectorSet,tempVector];
end

BgList=median(VectorSet,1);

end