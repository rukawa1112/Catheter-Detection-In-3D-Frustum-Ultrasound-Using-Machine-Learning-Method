function StatisticalFeature=StatisticalFeatureExtraction(V,Num)
    FVp=[];
    FVs=[];
    parfor m=1:Num
    n=2*m+1;
    FVt=[];
    STD=stdfilt(double(V),ones(n,n,n));
    MEAN=imfilter(double(V),ones(n,n,n)/(n^3));
    MAX=Maxin(V,n,1);
    MIN=Maxin(V,n,0);
    En=entropyfilt(double(V),ones(n,n,n));
    FVt=[STD(:),MEAN(:),MAX(:),MIN(:),En(:)];
    FVs(m).FVp=FVt;
    end
    for m=1:Num
        FVp=[FVp,FVs(m).FVp];
    end
    StatisticalFeature=single(FVp);