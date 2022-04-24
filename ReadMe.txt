The PhantomFrustum.mat includes 12 unconverted 3D US images from Phantom recording condition using TEE Ultrasound probe.
For each recording, it includes two type data, one is B-mode image while another one is manually annotated voxel indexes belonging to the catheter.
How to generate the mask (example code):
Vmask=zeros(size(VolumeOfUS));
Vmask(inliers)=1;
etc.

FeatureExtraction file includes scripts of how to extract the 3D features from 3D US, see my paper as reference, you can find more details of them.

Processing.m is an example of how to extract features from different dataset and different featuer type, also includes how to extract multi-scale features

LOOCVFusion.m shows example of how to perform the Leave-one-out-cross-validaton on each dataset.

If you have more questions, please feel free to contact me.