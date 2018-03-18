function A=var2ellipse7(act, bold, devact, devbold)

A=zeros(400);
%parametros originales
%valact=0.1:0.001:0.499;
%valbold=0.699:-0.001:0.3;
%parametros para Nacre
valact=0.1:0.001:0.499;
valbold=0.599:-0.001:0.2;
x0=nanmean(act(:,:,1),1);
y0=nanmean(bold(:,:,1),1);
for j=1:400
    for k=1:400
P=0;
for i=1:size(act,2)
P=P+(exp((-0.5)*((((valact(j)-x0(i))^2)/(devact^2))+(((valbold(k)-y0(i))^2)/(devbold^2)))));
end
A(k,j)=P/(2*pi*devact*devbold*size(act,2));
end
end
h=imagesc(A,[10 90]);
%caxis([10 90]);
caxis([10 90]);
colormap(jet)
%jet2=[1 1 1; jet];
%colormap(jet2)
xlabel('Activity');
ylabel('Boldness');