function [x,y]=phantom(m)
 load('PhantomFrustum.mat');
 x=Phantom(m).Data;
 y=Phantom(m).Inliers;
end