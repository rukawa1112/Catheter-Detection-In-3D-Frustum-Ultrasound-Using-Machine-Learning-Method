% function [Recall,Precision,Threshold,AUC,Specificity]=LOOCVFusion(TRAINID,TESTID,type,Name,Feature)
function [GT,Pre]=LOOCVFusion(TRAINID,TESTID,TYPE,Name,Feature)
%% training
load INDs
FVs=[];
for f=1:length(Feature)
    X=[];
    Y=[];
for i=1:length(TRAINID)
    load([Name,'\',Feature{f},'\DatasetTraing',num2str(TRAINID(i)),'.mat'])
    X=[X;TrainFV];
    Y=[Y;TrainingLabel];
end
    FVs=[FVs,X];
end
INDsTrain=repmat(IND,[size(FVs,1),1]);
Models=TrainingStage(FVs,Y,TYPE);
X=[];
for f=1:length(Feature)
load([Name,'\',Feature{f},'\Dataset',num2str(TESTID),'.mat'])
X=[X,FeatureVector];
Y=GroundTruth;
end
%%
if strcmpi(Name,'ExvivoLF6')
    if TESTID==4||TESTID==5
        X=X(1:8:end,:);
        Y=Y(1:8:end);
    end
end
[~,score] = predict(Models,X);
GT=Y;
Pre=score(:,2);
% [Xpr1,Ypr1,Tpr1,AUCpr] = perfcurve(Y,score(:,2),1,'xCrit', 'reca', 'yCrit', 'prec','TVals',[-30:0.02:30]);hold on
% Recall=Xpr1;
% Precision=Ypr1;
% Threshold=Tpr1;
% AUC=AUCpr;
% Ypr1(find(isnan(Ypr1)==1))=0;
% close all
% [~,Ypr1,~,~] = perfcurve(Y,score(:,2),1,'xCrit', 'reca','yCrit', 'spec','TVals',[-30:0.02:30]);hold on
% Specificity=Ypr1;
