function [ ACIm ] = AlignContrast( Im )
%input: (double) xyz imageset, output: (double) xyz imageset (within 0~1)
%with aligned contrast along z
[x,y,z]=size(Im);
temp=Im(:,:,1);
temp=sort(temp(:));
low25=temp(x*y*0.25);
high25=temp(x*y*0.75);
slope=high25-low25;
offset=(high25+low25)/2.0;
for i=2:z
    temp=Im(:,:,i);
    temp=sort(temp(:));
    low25w=temp(x*y*0.25);
    high25w=temp(x*y*0.75);
    slopew=high25w-low25w;
    offsetw=(high25w+low25w)/2.0;
    Im(:,:,i)=(Im(:,:,i)-offsetw).*(slope/slopew)+offset;
end
mx=max(Im(:));
mn=min(Im(:));
ACIm=(Im-mn)./(mx-mn);
end

