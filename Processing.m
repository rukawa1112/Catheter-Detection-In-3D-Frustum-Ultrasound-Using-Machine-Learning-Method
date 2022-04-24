clc
clear
load Datasets
FileName={'Phantom','ExvivoLC','ExvivoLF6','ExvivoLF7','Invivo'};
% for File=5
%     Name=FileName{File};
%     disp(['Processing...',Name])
%     SubData=eval(['Dataset.',Name;]);
%     NumofVolume=size(SubData,2);
%     FeatureType={'Frangi'};
%     for VolNum=1:NumofVolume
%         disp(['Processing...',num2str(VolNum)]);
%         V=SubData(VolNum).Volume;
%         Inlier=SubData(VolNum).Inliers;
%         Mask=SubData(VolNum).Mask;
%         [FeatureVector,GroundTruth,TrainingID,TrainingLabel]=FeatureVectorExtraction(V,Inlier,Mask,FeatureType);
%         FeatureVector=single(FeatureVector);
%         %%%%% Folder Name!!!!
%         save([Name,'\Frangi\Dataset',num2str(VolNum),'.mat'],'FeatureVector','GroundTruth','TrainingID','TrainingLabel','-v7.3');
%     end
% end
% 
% 
% for File=5
%     Name=FileName{File};
%     disp(['Processing...',Name])
%     SubData=eval(['Dataset.',Name;]);
%     NumofVolume=size(SubData,2);
%     FeatureType={'Hessian'};
%     for VolNum=1:NumofVolume
%         disp(['Processing...',num2str(VolNum)]);
%         V=SubData(VolNum).Volume;
%         Inlier=SubData(VolNum).Inliers;
%         Mask=SubData(VolNum).Mask;
%         [FeatureVector,GroundTruth,TrainingID,TrainingLabel]=FeatureVectorExtraction(V,Inlier,Mask,FeatureType);
%         FeatureVector=single(FeatureVector);
%         %%%%% Folder Name!!!!
%         save([Name,'\Hessian\Dataset',num2str(VolNum),'.mat'],'FeatureVector','GroundTruth','TrainingID','TrainingLabel','-v7.3');
%     end
% end
% 
% 
% for File=5
%     Name=FileName{File};
%     disp(['Processing...',Name])
%     SubData=eval(['Dataset.',Name;]);
%     NumofVolume=size(SubData,2);
%     FeatureType={'Objectness'};
%     for VolNum=1:NumofVolume
%         disp(['Processing...',num2str(VolNum)]);
%         V=SubData(VolNum).Volume;
%         Inlier=SubData(VolNum).Inliers;
%         Mask=SubData(VolNum).Mask;
%         [FeatureVector,GroundTruth,TrainingID,TrainingLabel]=FeatureVectorExtraction(V,Inlier,Mask,FeatureType);
%         FeatureVector=single(FeatureVector);
%         %%%%% Folder Name!!!!
%         save([Name,'\Objectness\Dataset',num2str(VolNum),'.mat'],'FeatureVector','GroundTruth','TrainingID','TrainingLabel','-v7.3');
%     end
% end


for File=1:5
    Name=FileName{File};
    disp(['Processing...',Name])
    SubData=eval(['Dataset.',Name;]);
    NumofVolume=size(SubData,2);
    FeatureType={'Statistical'};
    for VolNum=1:NumofVolume
        disp(['Processing...',num2str(VolNum)]);
        V=SubData(VolNum).Volume;
        Inlier=SubData(VolNum).Inliers;
        Mask=SubData(VolNum).Mask;
        [FeatureVector,GroundTruth,TrainingID,TrainingLabel]=FeatureVectorExtraction(V,Inlier,Mask,FeatureType);
        FeatureVector=single(FeatureVector);
        %%%%% Folder Name!!!!
        save([Name,'\Statistical\Dataset',num2str(VolNum),'.mat'],'FeatureVector','GroundTruth','TrainingID','TrainingLabel','-v7.3');
    end
end
