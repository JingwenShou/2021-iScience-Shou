function [ shiftedPearsonMatrix_3p ] = shiftedPearsonSta_3p( VectorSet, BgList )
%make sure that normalizations of two innputs are same scale and offset

ColorNumber=length(BgList);
for co=1:ColorNumber
    VectorSet(:,co)=VectorSet(:,co)-BgList(co);
end

shiftedPearsonMatrix_3p=zeros(ColorNumber,ColorNumber,ColorNumber);
for co1=1:ColorNumber
    for co2=1:ColorNumber
        for co3=1:ColorNumber
            Numerator=sum(VectorSet(:,co1).*VectorSet(:,co2).*VectorSet(:,co3));
            Denominator=power(sum(VectorSet(:,co1).^3),1/3)*power(sum(VectorSet(:,co2).^3),1/3)*power(sum(VectorSet(:,co3).^3),1/3);
            shiftedPearsonMatrix_3p(co1,co2,co3)=Numerator/Denominator;
        end
    end
end

end