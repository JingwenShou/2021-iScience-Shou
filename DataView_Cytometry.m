flag=1;

if flag==1  %sPearson_2p
    
    %load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\FBS-free\DataSta_output_11to25');
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\FBS-free\DataSta_output_SingleCell_11to25');
    
%     figure;
%     for i=1:length(shiftedPearsonMatrix_2p(1,1,:))
%         temp=shiftedPearsonMatrix_2p(:,:,i);
%         temp=temp(3:9,2:8);
%         imagesc(temp);
%         title(num2str(i));
%         colormap(jet)
%         caxis([0 1]);
%         box off;
%         xticklabels({'Nucleus','PM','Tubulin','Actin','Mito','Lyso','LD'});
%         yticklabels({'PM','Tubulin','Actin','Mito','Lyso','LD','ER'});
%         cb=colorbar;
%         %ylabel(cb,'Correlation coefficient');
%         waitforbuttonpress;
%     end
%     close;
    
    temp=median(shiftedPearsonMatrix_2p,3);
    temp=temp(3:9,2:8);
    figure=imagesc(temp);
    colormap(jet)
    caxis([0 1]);
    box off;
    xticklabels({'Nucleus','PM','Tubulin','Actin','Mito','Lyso','LD'});
    yticklabels({'PM','Tubulin','Actin','Mito','Lyso','LD','ER'});
    cb=colorbar;
    %ylabel(cb,'Correlation coefficient');

end

if flag==2  %sPearson_3p_Lyso
    
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\FBS-free\DataSta_output_11to25');
    temp=median(shiftedPearsonMatrix_3p,4);
    temp=temp(:,:,7);
    for i=1:9
        for j=i:9
            if j>=i
                temp(i,j)=2;
            end
        end
    end
    temp(7,:)=2;
    temp(:,7)=2;
    temp=temp(3:9,2:8);
    temp(5,:)=[];
    temp(:,6)=[];
    figure=imagesc(temp);
    %title('Correlation with Lyso');
    colormap(jet)
    caxis([0 1]);
    box off;
    xticklabels({'Nucleus','PM','Tubulin','Actin','Mito','LD'});
    yticklabels({'PM','Tubulin','Actin','Mito','LD','ER'});
    cb=colorbar;
    %ylabel(cb,'Correlation coefficient');

end

if flag==3  %sPearson_3p_LD
    
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\FBS-free\DataSta_output_11to25');
    temp=median(shiftedPearsonMatrix_3p,4);
    temp=temp(:,:,8);
    for i=1:9
        for j=i:9
            if j>=i
                temp(i,j)=2;
            end
        end
    end
    temp(8,:)=2;
    temp(:,8)=2;
    temp=temp(3:9,2:8);
    temp(6,:)=[];
    temp(:,7)=[];
    figure=imagesc(temp);
    %title('Correlation with LD');
    colormap(jet)
    caxis([0 1]);
    box off;
    xticklabels({'Nucleus','PM','Tubulin','Actin','Mito','Lyso'});
    yticklabels({'PM','Tubulin','Actin','Mito','Lyso','ER'});
    cb=colorbar;
    %ylabel(cb,'Correlation coefficient');

end

if flag==4  %sPearson_2p_boxplot
    
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\Control\DataSta_output_11to40');
    sPearson_2p_control=shiftedPearsonMatrix_2p(2:9,2:9,:);
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\FBS-free\DataSta_output_11to25');
    sPearson_2p_FBSfree=shiftedPearsonMatrix_2p(2:9,2:9,:);
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\High-OA\DataSta_output_11to40');
    sPearson_2p_highOA=shiftedPearsonMatrix_2p(2:9,2:9,:);
    Seq={'Nucleus','PM','Tubulin','Actin','Mito','Lyso','LD','ER'};
%     for i=1:8	%scatter
%         fig=figure;
%         set(fig,'Position',get(0,'ScreenSize'));
%         hold on;
%         for j=1:8
%             for n=1:size(sPearson_2p_control,3)
%                 scatter(j-0.2,sPearson_2p_control(i,j,n),'r');
%             end
%             for n=1:size(sPearson_2p_FBSfree,3)
%                 scatter(j,sPearson_2p_FBSfree(i,j,n),'g');
%             end
%             for n=1:size(sPearson_2p_highOA,3)
%                 scatter(j+0.2,sPearson_2p_highOA(i,j,n),'b');
%             end
%         end
%         box off;
%         xlim([0 9]);
%         ylim([-0.1 1.1]);
%         xticks([1:8]);
%         xticklabels(Seq);
%         xtickangle(45);
%         title(['correlation with ',Seq(i)]);
%         waitforbuttonpress;
%     end
%     for i=1:8
%         fig1=figure;	%violin
%         set(fig1,'Position',get(0,'ScreenSize'));
%         hold on;
%         sampleNumber=size(sPearson_2p_control,3);
%         violin(reshape(sPearson_2p_control(i,:,:),8,sampleNumber)'+rand(sampleNumber,8).*(10e-10),'x',(1:8)-0.2,'facecolor',[1 0 0]);
%         sampleNumber=size(sPearson_2p_FBSfree,3);
%         violin(reshape(sPearson_2p_FBSfree(i,:,:),8,sampleNumber)'+rand(sampleNumber,8).*(10e-10),'x',(1:8),'facecolor',[0 1 0]);
%         sampleNumber=size(sPearson_2p_highOA,3);
%         violin(reshape(sPearson_2p_highOA(i,:,:),8,sampleNumber)'+rand(sampleNumber,8).*(10e-10),'x',(1:8)+0.2,'facecolor',[0 0 1]);
%         box off;
%         xlim([0 9]);
%         ylim([-0.1 1.1]);
%         xticks([1:8]);
%         xticklabels(Seq);
%         xtickangle(45);
%         title(['correlation with ',Seq(i)]);
%         fig2=figure;    %boxplot
%         set(fig2,'Position',get(0,'ScreenSize')+[1920,0,0,0]);
%         hold on;
%         sampleNumber=size(sPearson_2p_control,3);
%         boxplot(reshape(sPearson_2p_control(i,:,:),8,sampleNumber)','Positions',(1:8)-0.2,'Colors',[1 0 0],'notch','on');
%         sampleNumber=size(sPearson_2p_FBSfree,3);
%         boxplot(reshape(sPearson_2p_FBSfree(i,:,:),8,sampleNumber)','Positions',(1:8),'Colors',[0 1 0],'notch','on');
%         sampleNumber=size(sPearson_2p_highOA,3);
%         boxplot(reshape(sPearson_2p_highOA(i,:,:),8,sampleNumber)','Positions',(1:8)+0.2,'Colors',[0 0 1],'notch','on');
%         box off;
%         xlim([0 9]);
%         ylim([-0.1 1.1]);
%         xticks([1:8]);
%         xticklabels(Seq);
%         xtickangle(45);
%         title(['correlation with ',Seq(i)]);
%         waitforbuttonpress;
%     end
	fig2=figure;    %boxplot
    set(fig2,'Position',get(0,'ScreenSize')+[1920,0,0,0]);
    hold on;
    sPearson_2p_control_analysis=[];
    sPearson_2p_FBSfree_analysis=[];
    sPearson_2p_highOA_analysis=[];
    xTickLabelSeq=[];
    %selection=[3,6;3,7;4,5;5,6;5,7;6,7];
    selection=[6,3;6,4;6,5;6,7;6,8;7,3;7,4;7,5;7,8];
    for i=1:size(selection,1)
        analysis_temp=sPearson_2p_control(selection(i,1),selection(i,2),:);
        sPearson_2p_control_analysis=[sPearson_2p_control_analysis,analysis_temp(:)];
        analysis_temp=sPearson_2p_FBSfree(selection(i,1),selection(i,2),:);
        sPearson_2p_FBSfree_analysis=[sPearson_2p_FBSfree_analysis,analysis_temp(:)];
        analysis_temp=sPearson_2p_highOA(selection(i,1),selection(i,2),:);
        sPearson_2p_highOA_analysis=[sPearson_2p_highOA_analysis,analysis_temp(:)];
        Label_temp=join([Seq(selection(i,1)),'&',Seq(selection(i,2))]);
        xTickLabelSeq=[xTickLabelSeq,Label_temp];
    end
    boxplot(sPearson_2p_control_analysis,'Positions',(1:size(selection,1))-0.25,'Colors',[1 0 0],'Symbol','o','Widths',0.2);
    boxplot(sPearson_2p_FBSfree_analysis,'Positions',(1:size(selection,1)),'Colors',[0 1 0],'Symbol','o','Widths',0.2);
    boxplot(sPearson_2p_highOA_analysis,'Positions',(1:size(selection,1))+0.25,'Colors',[0 0 1],'Symbol','o','Widths',0.2);
    box off;
    xlim([0 size(selection,1)+1]);
    ylim([0 1]);
    xticks([1:size(selection,1)]);
    xticklabels(xTickLabelSeq);
    yticks(0:0.1:1);
    ylabel('Correlation coefficient');
    tt=ones(size(selection,1),3);   %unpaired two-tailed t-test ( 1 or 0.05 or 0.01 )
    for i=1:size(selection,1)
        ttsample1=sPearson_2p_control_analysis(:,i);
        ttsample2=sPearson_2p_FBSfree_analysis(:,i);
        ttsample3=sPearson_2p_highOA_analysis(:,i);
        if(ttest2(ttsample1,ttsample2,'Alpha',0.01,'Tail','both','Vartype','unequal')==1)
            tt(i,1)=0.01;
        else
            if(ttest2(ttsample1,ttsample2,'Alpha',0.05,'Tail','both','Vartype','unequal')==1)
                tt(i,1)=0.05;
            else
                tt(i,1)=1;
            end
        end
        if(ttest2(ttsample1,ttsample3,'Alpha',0.01,'Tail','both','Vartype','unequal')==1)
            tt(i,2)=0.01;
        else
            if(ttest2(ttsample1,ttsample3,'Alpha',0.05,'Tail','both','Vartype','unequal')==1)
                tt(i,2)=0.05;
            else
                tt(i,2)=1;
            end
        end
        if(ttest2(ttsample2,ttsample3,'Alpha',0.01,'Tail','both','Vartype','unequal')==1)
            tt(i,3)=0.01;
        else
            if(ttest2(ttsample2,ttsample3,'Alpha',0.05,'Tail','both','Vartype','unequal')==1)
                tt(i,3)=0.05;
            else
                tt(i,3)=1;
            end
        end
    end
    for i=1:size(selection,1)
        text(i-0.25,0.98,num2str(tt(i,1)));
        text(i,0.99,num2str(tt(i,2)));
        text(i+0.25,0.98,num2str(tt(i,3)));
    end
    
end

if flag==5  %sPearson_3p_boxplot
    
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\Control\DataSta_output_11to40');
    sPearson_3p_control=shiftedPearsonMatrix_3p(2:9,2:9,2:9,:);
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\FBS-free\DataSta_output_11to25');
    sPearson_3p_FBSfree=shiftedPearsonMatrix_3p(2:9,2:9,2:9,:);
    load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\High-OA\DataSta_output_11to40');
    sPearson_3p_highOA=shiftedPearsonMatrix_3p(2:9,2:9,2:9,:);
    Seq={'Nucleus','PM','Tubulin','Actin','Mito','Lyso','LD','ER'};
%     for i=1:8
%         for j=1:8
%             fig1=figure;    %violin
%             set(fig1,'Position',get(0,'ScreenSize'));
%             hold on;
%             sampleNumber=size(sPearson_3p_control,4);
%             violin(reshape(sPearson_3p_control(i,j,:,:),8,sampleNumber)'+rand(sampleNumber,8).*(10e-10),'x',(1:8)-0.2,'facecolor',[1 0 0]);
%             sampleNumber=size(sPearson_3p_FBSfree,4);
%             violin(reshape(sPearson_3p_FBSfree(i,j,:,:),8,sampleNumber)'+rand(sampleNumber,8).*(10e-10),'x',(1:8),'facecolor',[0 1 0]);
%             sampleNumber=size(sPearson_3p_highOA,4);
%             violin(reshape(sPearson_3p_highOA(i,j,:,:),8,sampleNumber)'+rand(sampleNumber,8).*(10e-10),'x',(1:8)+0.2,'facecolor',[0 0 1]);
%             box off;
%             xlim([0 9]);
%             ylim([-0.1 1.1]);
%             xticks([1:8]);
%             xticklabels(Seq);
%             xtickangle(45);
%             title(['correlation with ',Seq(i),Seq(j)]);
%             fig2=figure;    %boxplot
%             set(fig2,'Position',get(0,'ScreenSize')+[1920,0,0,0]);
%             hold on;
%             sampleNumber=size(sPearson_3p_control,4);
%             boxplot(reshape(sPearson_3p_control(i,j,:,:),8,sampleNumber)','Positions',(1:8)-0.2,'Colors',[1 0 0],'notch','on');
%             sampleNumber=size(sPearson_3p_FBSfree,4);
%             boxplot(reshape(sPearson_3p_FBSfree(i,j,:,:),8,sampleNumber)','Positions',(1:8),'Colors',[0 1 0],'notch','on');
%             sampleNumber=size(sPearson_3p_highOA,4);
%             boxplot(reshape(sPearson_3p_highOA(i,j,:,:),8,sampleNumber)','Positions',(1:8)+0.2,'Colors',[0 0 1],'notch','on');
%             box off;
%             xlim([0 9]);
%             ylim([-0.1 1.1]);
%             xticks([1:8]);
%             xticklabels(Seq);
%             xtickangle(45);
%             title(['correlation with ',Seq(i),Seq(j)]);
%             waitforbuttonpress;
%         end
%     end
	fig2=figure;    %boxplot
    set(fig2,'Position',get(0,'ScreenSize')+[1920,0,0,0]);
    hold on;
    sPearson_3p_control_analysis=[];
    sPearson_3p_FBSfree_analysis=[];
    sPearson_3p_highOA_analysis=[];
    xTickLabelSeq=[];
    %selection=[3,6,4];
    selection=[6,7,3;6,7,5;6,7,8];
    for i=1:size(selection,1)
        analysis_temp=sPearson_3p_control(selection(i,1),selection(i,2),selection(i,3),:);
        sPearson_3p_control_analysis=[sPearson_3p_control_analysis,analysis_temp(:)];
        analysis_temp=sPearson_3p_FBSfree(selection(i,1),selection(i,2),selection(i,3),:);
        sPearson_3p_FBSfree_analysis=[sPearson_3p_FBSfree_analysis,analysis_temp(:)];
        analysis_temp=sPearson_3p_highOA(selection(i,1),selection(i,2),selection(i,3),:);
        sPearson_3p_highOA_analysis=[sPearson_3p_highOA_analysis,analysis_temp(:)];
        Label_temp=join([Seq(selection(i,1)),'&',Seq(selection(i,2)),'&',Seq(selection(i,3))]);
        xTickLabelSeq=[xTickLabelSeq,Label_temp];
    end
    boxplot(sPearson_3p_control_analysis,'Positions',(1:size(selection,1))-0.25,'Colors',[1 0 0],'Symbol','o','Widths',0.2);
    boxplot(sPearson_3p_FBSfree_analysis,'Positions',(1:size(selection,1)),'Colors',[0 1 0],'Symbol','o','Widths',0.2);
    boxplot(sPearson_3p_highOA_analysis,'Positions',(1:size(selection,1))+0.25,'Colors',[0 0 1],'Symbol','o','Widths',0.2);
    box off;
    xlim([0 size(selection,1)+1]);
    ylim([0 1]);
    xticks([1:size(selection,1)]);
    xticklabels(xTickLabelSeq);
    yticks(0:0.1:1);
    ylabel('Correlation coefficient');
    tt=ones(size(selection,1),3);   %unpaired two-tailed t-test ( 1 or 0.05 or 0.01 )
    for i=1:size(selection,1)
        ttsample1=sPearson_3p_control_analysis(:,i);
        ttsample2=sPearson_3p_FBSfree_analysis(:,i);
        ttsample3=sPearson_3p_highOA_analysis(:,i);
        if(ttest2(ttsample1,ttsample2,'Alpha',0.01,'Tail','both','Vartype','unequal')==1)
            tt(i,1)=0.01;
        else
            if(ttest2(ttsample1,ttsample2,'Alpha',0.05,'Tail','both','Vartype','unequal')==1)
                tt(i,1)=0.05;
            else
                tt(i,1)=1;
            end
        end
        if(ttest2(ttsample1,ttsample3,'Alpha',0.01,'Tail','both','Vartype','unequal')==1)
            tt(i,2)=0.01;
        else
            if(ttest2(ttsample1,ttsample3,'Alpha',0.05,'Tail','both','Vartype','unequal')==1)
                tt(i,2)=0.05;
            else
                tt(i,2)=1;
            end
        end
        if(ttest2(ttsample2,ttsample3,'Alpha',0.01,'Tail','both','Vartype','unequal')==1)
            tt(i,3)=0.01;
        else
            if(ttest2(ttsample2,ttsample3,'Alpha',0.05,'Tail','both','Vartype','unequal')==1)
                tt(i,3)=0.05;
            else
                tt(i,3)=1;
            end
        end
    end
    for i=1:size(selection,1)
        text(i-0.25,0.98,num2str(tt(i,1)));
        text(i,0.99,num2str(tt(i,2)));
        text(i+0.25,0.98,num2str(tt(i,3)));
    end  

end






