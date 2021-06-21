function [ VectorSet ] = applyMask( ImSet, PMMask, ArtifactMask, trimXY1, trimXY2 )
%Input Image should be double values normalized to 0~1 (by using 'im2double(imread(FilePath));')

Mask=PMMask&(~ArtifactMask);
tempImSet=ImSet;
colorNumber=size(ImSet,3);
for co=1:colorNumber
    tempImSet(:,:,co)=ImSet(:,:,co).*Mask+(Mask-1);
end

tempImSet=tempImSet(trimXY1(1):trimXY2(1),trimXY1(2):trimXY2(2),:);

VectorSet=[];
for co=1:colorNumber
    tempVector=tempImSet(:,:,co);
    tempVector=tempVector(:);
    tempVector(find(tempVector<-0.5))=[];
    VectorSet=[VectorSet,tempVector];
end

end