function HessianFeature=HessianFeatureExtraction(V,sigmas)
    HessianFeature=[];
    parfor i=1:length(sigmas)
    Vhelp=[];
    [Dxx, Dxy, Dyy, Dyz, Dzz, Dxz]=Hessian(V,sigmas(i));
    Vhelp=[Dxx(:),Dxy(:),Dyy(:),Dyz(:),Dzz(:),Dxz(:)];
    [v,l]=max(Vhelp,[],2);
    [m,n] = size(Vhelp);
    [R,C]=ndgrid(1:m,1:n);
    C=mod(bsxfun(@plus,C,l(:)-1),n)+1;
    VhelpCS=Vhelp;
    VhelpCS(:)=Vhelp(sub2ind([m n],R,C));
    HessianFeature=[HessianFeature,VhelpCS];
    end