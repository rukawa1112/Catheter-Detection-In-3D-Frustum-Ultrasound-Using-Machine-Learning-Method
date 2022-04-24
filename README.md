# Catheter-Detection-In-3D-Frustum-Ultrasound-Using-Machine-Learning-Method

Background:Nowadays, 3D ultrasound (US) has been developed rapidly in medical intervention therapies, such as the cardiac catheterization. Conventionally, the 3D imaging methods are based on Cartesian domain, which is limited by bandwidth and information lose when it is converted from the original acquisition space—Frustum domain. The exploration of catheter detection back to Frustum space helps to faciliate the development of instrument detection in terms of system application.

The experiment contains two main steps.

step 1: extract the feature vector from 3d us image. Here we adopt 4 different previously designed handcrafted features, which have a good performance for catheter voxel classification in Cartesian domain , and exploit its capacity in Frustum domain. 

Feature 1: Objectness features

Feature 2: Hessian features

Feature 3: Statistical features

Feature 4: log-Gabor features

The step 2 is the voxel-based classification.

We applied 3 Discriminant classifiers: 

Linear Support Vector Machine (LSVM)

Linear Discriminant Analysis (LDA)

Random Forest (RF) 

The figure shows the process of the experiment.
![steps1](https://user-images.githubusercontent.com/40002403/164995163-ef2a7969-2b9d-4290-986b-fd7bc86994f9.JPG)


The PhantomFrustum.mat includes 12 unconverted 3D US images from Phantom recording condition using TEE Ultrasound probe.
For each recording, it includes two type data, one is B-mode image while another one is manually annotated voxel indexes belonging to the catheter.
How to generate the mask (example code):
Vmask=zeros(size(VolumeOfUS));
Vmask(inliers)=1;
etc.

FeatureExtraction file includes scripts of how to extract the 3D features from 3D US.

Processing.m is an example of how to extract features from different dataset and different featuer type, also includes how to extract multi-scale features

LOOCVFusion.m shows example of how to perform the Leave-one-out-cross-validaton on each dataset.

