flag=1;

if flag==1  %sPearson_2p
    
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterVBM3D\Mitosis\DataSta_output_41to48');
    for s=1:8
        temp=shiftedPearsonMatrix_2p(:,:,s);
        temp=temp(3:9,2:8);
        fig=figure;
        imagesc(temp);
        colormap(jet)
        caxis([0 1]);
        box off;
        title(num2str(40+s));
        xticklabels({'Nucleus','PM','Tubulin','Actin','Mito','Lyso','LD'});
        yticklabels({'PM','Tubulin','Actin','Mito','Lyso','LD','ER'});
        cb=colorbar;
        %ylabel(cb,'Correlation coefficient');
        waitforbuttonpress;
    end
    
end





