function [FeatureVector,GroundTruth,TrainingID,TrainingLabel]=FeatureVectorExtraction(V,Inlier,Mask,FeatureType)
FeatureVector=[];
addpath('FeatureExtraction');
Vhelp=zeros(size(Mask));
Vhelp(Inlier)=1;
NID=find(Vhelp==0);
PID=find(Vhelp==1);
rng(1);
SampleID=randsample(length(NID),length(NID)-length(PID));
ID=NID(SampleID);
TrainingID=1:length(V(:));
TrainingID(ID)=[];
GroundTruth=Vhelp(:);
TrainingLabel=Vhelp(:);
TrainingLabel(ID)=[];
FeatureVector=V(:);
sigmas=1:5;
if find(strcmp(FeatureType, 'Frangi'))
    ObjectiveFeature=ObjectiveFeatureExtraction(V,sigmas);
    Frangi=ObjectiveFeature.Tube;
    FeatureVector=[FeatureVector,Frangi];
end

if find(strcmp(FeatureType, 'Objectness'))
    ObjectiveFeature=ObjectiveFeatureExtraction(V,sigmas);
    FeatureVector=[FeatureVector,ObjectiveFeature.Tube,ObjectiveFeature.Ball,ObjectiveFeature.Plate];
end
Num=5;
if find(strcmp(FeatureType, 'Statistical'))
    StatisticalFeature=StatisticalFeatureExtraction(V,Num);
    FeatureVector=[FeatureVector,StatisticalFeature];
end

if find(strcmp(FeatureType, 'Hessian'))
    HessianFeature=HessianFeatureExtraction(V,sigmas);
    FeatureVector=[FeatureVector,HessianFeature];
end
if find(strcmp(FeatureType, 'logGabor'))
    Wavelength=[1:1:5]*2*pi;Angle=15:50:165;
    logGaborFeature=logGaborFeatureExtraction(V,Wavelength,Angle);
    FeatureVector=[FeatureVector,logGaborFeature];
end
