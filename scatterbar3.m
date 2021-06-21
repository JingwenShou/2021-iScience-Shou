function scatterbar3(X,Y,Z,width,color)

[r,c]=size(Z);
for j=1:r,
    for k=1:c,
        if ~isnan(Z(j,k))
            drawbar(X(j,k),Y(j,k),Z(j,k),width/2,color)
        end
    end
end

function drawbar(x,y,z,width,color)

h(1)=patch([-width -width width width]+x,[-width width width -width]+y,[0 0 0 0],color,'EdgeColor','none');
h(2)=patch(width.*[-1 -1 1 1]+x,width.*[-1 -1 -1 -1]+y,z.*[0 1 1 0],color,'EdgeColor','none');
h(3)=patch(width.*[-1 -1 -1 -1]+x,width.*[-1 -1 1 1]+y,z.*[0 1 1 0],color,'EdgeColor','none');
h(4)=patch([-width -width width width]+x,[-width width width -width]+y,[z z z z],color,'EdgeColor','none');
h(5)=patch(width.*[-1 -1 1 1]+x,width.*[1 1 1 1]+y,z.*[0 1 1 0],color,'EdgeColor','none');
h(6)=patch(width.*[1 1 1 1]+x,width.*[-1 -1 1 1]+y,z.*[0 1 1 0],color,'EdgeColor','none');