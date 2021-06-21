no_dims=2;
init_dims=28; % Max 28
perplexity=30;

Set_init_dims=10:2:18;
Set_perplexity=10:2:18;

% Calculation
for init_dims=Set_init_dims
    for perplexity=Set_perplexity
    
        CytometryData=[];
        labels=[];
        tags=[];
        counter=0;

        load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\Control\DataSta_output_SingleCell_11to40');
        for i=1:size(shiftedPearsonMatrix_2p,3)
            counter=counter+1;
            temp=shiftedPearsonMatrix_2p(2:9,2:9,i);
            temp=tril(temp+99,-1)-99;
            temp=temp(:);
            temp(find(temp<-90))=[];
            CytometryData(counter,:)=temp;
            labels(counter)=1;  %Control
            tags(1,counter)=1;  %Control
            tags(2,counter)=i;
        end

        load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\FBS-free\DataSta_output_SingleCell_11to25');
        for i=1:size(shiftedPearsonMatrix_2p,3)
            counter=counter+1;
            temp=shiftedPearsonMatrix_2p(2:9,2:9,i);
            temp=tril(temp+99,-1)-99;
            temp=temp(:);
            temp(find(temp<-90))=[];
            CytometryData(counter,:)=temp;
            labels(counter)=2;  %FBS-free
            tags(1,counter)=2;  %FBS-free
            tags(2,counter)=i;
        end

        load('C:\Users\SJW-desktop\Desktop\NC2\ProcessedData\afterBM3D\Cytometry\High-OA\DataSta_output_SingleCell_11to40');
        for i=1:size(shiftedPearsonMatrix_2p,3)
            counter=counter+1;
            temp=shiftedPearsonMatrix_2p(2:9,2:9,i);
            temp=tril(temp+99,-1)-99;
            temp=temp(:);
            temp(find(temp<-90))=[];
            CytometryData(counter,:)=temp;
            labels(counter)=3;  %High-OA
            tags(1,counter)=3;  %High-OA
            tags(2,counter)=i;
        end

        mappedX = tsne(CytometryData, labels, no_dims, init_dims, perplexity);
        gscatter(mappedX(:,1), mappedX(:,2), labels);
        title([' initdims ',num2str(init_dims),' perplexity ',num2str(perplexity)]);
        pause(0.5);

        mkdir('C:\Users\SJW-desktop\Desktop\TempView');
        savefig(['C:\Users\SJW-desktop\Desktop\TempView\tSNE_sPearson_2p_Cytometry_',' initdims ',num2str(init_dims),' perplexity ',num2str(perplexity),'.fig']);
        saveas(gcf,['C:\Users\SJW-desktop\Desktop\TempView\tSNE_sPearson_2p_Cytometry_',' initdims ',num2str(init_dims),' perplexity ',num2str(perplexity),'.tif']);
        save('C:\Users\SJW-desktop\Desktop\TempView\tags.mat','tags');

        close;

    end
end

% Display
counter=0;
for init_dims=Set_init_dims
    for perplexity=Set_perplexity
        
        counter=counter+1;
        subplot(length(Set_init_dims),length(Set_perplexity),counter);
        hold on;
        imshow(['C:\Users\SJW-desktop\Desktop\TempView\tSNE_sPearson_2p_Cytometry_',' initdims ',num2str(init_dims),' perplexity ',num2str(perplexity),'.tif']);
        title(['id',num2str(init_dims),'p',num2str(perplexity)]);
        
    end    
end