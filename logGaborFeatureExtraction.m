function logGaborFeature=logGaborFeatureExtraction(V,Wavelength,Angle)
    logGaborFeature=[];
    logGBB=logGabor3D(V,Wavelength,Angle,Angle,0.65,30);
    Vfft=fftn(V);
    for k=1:length(Wavelength)
       Vhelp=single(zeros(length(V(:)),length(Angle)^2));
       for i=1:length(Angle)
           for j=1:length(Angle)
           temp=real(ifftn(Vfft.*logGBB{k,i,j}));
           Vhelp(:,(i-1)*length(Angle)+j)=temp(:);
           end
       end
       Seg=2^14;
       L=floor(length(Vhelp)/Seg);
       FV=zeros(size(Vhelp));
       for period=1:L
           if period<L
               Vtemp=Vhelp((period-1)*Seg+1:period*Seg,:);
               [v,l]=max(Vtemp,[],2);
               [m,n] = size(Vtemp);
               [R,C]=ndgrid(1:m,1:n);
               C=mod(bsxfun(@plus,C,l(:)-1),n)+1;
               VhelpCS=Vtemp;
               VhelpCS(:)=Vtemp(sub2ind([m n],R,C));
               FV((period-1)*Seg+1:period*Seg,:)=VhelpCS;
           else
               Vtemp=Vhelp((period-1)*Seg+1:end,:);
               [v,l]=max(Vtemp,[],2);
               [m,n] = size(Vtemp);
               [R,C]=ndgrid(1:m,1:n);
               C=mod(bsxfun(@plus,C,l(:)-1),n)+1;
               VhelpCS=Vtemp;
               VhelpCS(:)=Vtemp(sub2ind([m n],R,C));
               FV((period-1)*Seg+1:end,:)=VhelpCS;
           end
       end
       logGaborFeature=[logGaborFeature,single(FV)];
    end