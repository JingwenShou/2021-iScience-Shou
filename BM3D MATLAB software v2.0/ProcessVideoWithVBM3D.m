FilePath=uigetdir('C:\Users\SJW-desktop\Desktop\NC2\Data\afterVBM3D');

StartFolder=51;
EndFolder=60;
StartFrame=1;
EndFrame=6;

for fm=StartFrame:EndFrame
    Im=zeros(500,500,EndFolder-StartFolder+1);
    for fd=StartFolder:EndFolder
        Im(:,:,fd-StartFolder+1)=double(imread([FilePath,'\',sprintf('%1d',fd),'\',sprintf('%1d',fm),'.tif']));
    end
    Im=AlignContrast(Im);
    if     fm==1
        r=0.5;
    elseif fm==2
        r=0.5;
    elseif fm==3
        r=0.5;
    elseif fm==4
        r=1;
    elseif fm==5
        r=1;
    elseif fm==6
        r=1;
    elseif fm==7
        r=1;
    elseif fm==8
        r=1;
    elseif fm==9
        r=1;
    else
        r=1;
    end
    [PSNR,DenoisedIm]=VBM3D(Im,std(Im(:))*255*r);
    for fd=StartFolder:EndFolder
        imwrite(double(DenoisedIm(:,:,fd-StartFolder+1)),[FilePath,'\',sprintf('%1d',fd),'\',sprintf('%1d',fm),'.tif']);
    end
end