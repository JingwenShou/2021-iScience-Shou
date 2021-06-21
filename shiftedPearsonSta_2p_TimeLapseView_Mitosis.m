load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterVBM3D\Mitosis\DataSta_output_41to48');
Seq={'Tubulin','Actin','Mito','Lyso','LD','ER'};
colorSetting=[0 1 0; 1 0 1; 0 1 1; 1 0 0; 1 1 0; 0 0 1];
for i=4:9
    fig=figure;
    hold on;
    title(Seq(i-3));
    for j=4:9
        temp=shiftedPearsonMatrix_2p(i,j,:);
        p=plot(temp(:),'Color',colorSetting(j-3,:));
        waitforbuttonpress;
    end
    xticks(1:8);
    xticklabels({'0','20','40','60','80','100','120','140'});
    xlabel('Time (s)');
    ylabel('Relative distance to PM');
    legend(Seq);
end