# Catheter-Detection-In-3D-Frustum-Ultrasound-Using-Machine-Learning-Method
The experiment contains two main steps.

step 1: extract the feature vector from 3d us image. Here we adopt 4 different previously designed handcrafted features, which have a good performance for catheter voxel classification in Cartesian domain , and exploit its capacity in Frustum domain. 

Feature 1: Objectness features

Feature 2: Hessian features

Feature 3: Statistical features

Feature 4: log-Gabor features

The step 2 is the voxel-based classification.

3 Discriminant classifiers: 

Linear Support Vector Machine (LSVM)

Linear Discriminant Analysis (LDA)

Random Forest (RF) 


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

![image](https://user-images.githubusercontent.com/40002403/164996107-207ceebc-f7cb-4ea5-99b1-ad24b02c8849.png)

![image](https://user-images.githubusercontent.com/40002403/164996124-a05ea61a-d747-4a23-94ca-b6d577e576cb.png)
