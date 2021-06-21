function [ expandedImage ] = expand( image )
%the pages are reassigned from top to bottom sequentially
[x,y,z]=size(image);
expandedImage=zeros(x*y,z);
for i=1:x
    for j=1:y
        expandedImage((i-1)*y+j,:)=image(i,j,:);
    end
end
end

