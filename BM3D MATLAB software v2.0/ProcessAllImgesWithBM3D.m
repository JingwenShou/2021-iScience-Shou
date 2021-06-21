function [ ok ] = ProcessAllImgesWithBM3D( FilePath )

list=dir(FilePath);
for i=3:size(list,1)
    if(list(i).isdir)
        ProcessAllImgesWithBM3D([FilePath,'\',list(i).name]);
    else
        if ~isempty(strfind(list(i).name,'.tif'))
            Im=im2double(imread([FilePath,'\',list(i).name]));
            if     ~isempty(strfind(list(i).name,'1.tif'))
                r=1;
            elseif ~isempty(strfind(list(i).name,'2.tif'))
                r=1;
            elseif ~isempty(strfind(list(i).name,'3.tif'))
                r=1;
            elseif ~isempty(strfind(list(i).name,'4.tif'))
                r=1;
            elseif ~isempty(strfind(list(i).name,'5.tif'))
                r=1;
            elseif ~isempty(strfind(list(i).name,'6.tif'))
                r=1;
            elseif ~isempty(strfind(list(i).name,'7.tif'))
                r=1;
            elseif ~isempty(strfind(list(i).name,'8.tif'))
                r=1;
            elseif ~isempty(strfind(list(i).name,'9.tif'))
                r=1;
            else
                r=1;
            end
            [PSNR,DenoisedIm]=BM3D(1,Im,std(Im(:))*255*r);
            imwrite(DenoisedIm,[FilePath,'\',list(i).name]);
        end
    end
end

ok=1;

end