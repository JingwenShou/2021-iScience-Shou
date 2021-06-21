function [ shiftedPearsonMatrix_2p ] = shiftedPearsonSta_2p( VectorSet, BgList )
%make sure that normalizations of two innputs are same scale and offset

ColorNumber=length(BgList);
for co=1:ColorNumber
    VectorSet(:,co)=VectorSet(:,co)-BgList(co);
end

shiftedPearsonMatrix_2p=zeros(ColorNumber,ColorNumber);
for co1=1:ColorNumber
    for co2=1:ColorNumber
        Numerator=sum(VectorSet(:,co1).*VectorSet(:,co2));
        Denominator=sqrt(sum(VectorSet(:,co1).^2))*sqrt(sum(VectorSet(:,co2).^2));
        shiftedPearsonMatrix_2p(co1,co2)=Numerator/Denominator;
    end
end

end