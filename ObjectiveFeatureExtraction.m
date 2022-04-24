function ObjectiveFeature=ObjectiveFeatureExtraction(V,sigmas)
    Tube=zeros([length(V(:)),length(sigmas)]);
    Ball=zeros([length(V(:)),length(sigmas)]);
    Plate=zeros([length(V(:)),length(sigmas)]);
    for i=1:length(sigmas)
    [Jt,Jb,Jp]=Jgenernation(V,sigmas(i));
    Jt=Jt(:);Jb=Jb(:);Jp=Jp(:);
    Tube(:,i)=Jt;Ball(:,i)=Jb;Plate(:,i)=Jp;
    end
    ObjectiveFeature.Tube=Tube;
    ObjectiveFeature.Ball=Ball;
    ObjectiveFeature.Plate=Plate;