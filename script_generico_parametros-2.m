load('/Users/Angel/Documents/MATLAB/clustersYY1/ab/segm/datosegm.mat');
load('/Users/Angel/Documents/MATLAB/clustersYY1/ab/segm/trayectorias.mat');

n_placa=24;
n_frames=30000;
m_frames=28000;
shift_frames=2001;


disSample=realsqrt((trayectorias(2:n_frames+1,:,1)-trayectorias(1:n_frames,:,1)).^2+(trayectorias(2:n_frames+1,:,2)-trayectorias(1:n_frames,:,2)).^2);
posSample=realsqrt((trayectorias(1:n_frames,:,1)-repmat(datosegm.platos.x0(1,:),n_frames,1)).^2+(trayectorias(1:n_frames,:,2)-repmat(datosegm.platos.y0(1,:),n_frames,1)).^2);

actSample=nansum(disSample(shift_frames:n_frames,:)>0,1)/m_frames;
boldSample=1-nanmean(posSample,1)/70;

names_plot={'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'};

figure,text(actSample(1:n_placa),boldSample(1:n_placa),names_plot);xlim([0.1 0.5]);ylim([0.3 0.7]);

