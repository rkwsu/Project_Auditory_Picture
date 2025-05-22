‘Auditory_Cortical_Movie_Snapshots.m’, ‘Picture_Cortical_Movie_Snapshots.m’
create videos and snapshots showing cortical high-gamma dynamics.

‘Auditory_HGA_modulation.m’, ‘Picture_HGA_modulation.m’
detect significant group-level high-gamma augmentation/attenuation in each ROI.

‘Auditory_FC_modulation.m’, ‘Picture_FC_modulation.m’
identify pairs of ROIs that exhibit significant and simultaneous high-gamma augmentation/attenuation at five or more consecutive time bins.

‘Auditory_Tract_Data.m’, ‘Picture_Tract_Data.m’
Step 1: Identify tracts stored in the ‘streamline_template’ folder based on the pairs of ROIs identified in STEP8 above.
Step 2: Adjust the opacity of white matter tracts in the video.

‘Auditory_DTI_Movie_Snapshots.m’, ‘Picture_DTI_Movie_Snapshots.m’
create videos and snapshots of functional connectivity/coactivation networks.

The FieldTrip toolbox is required. Please download it separately.
Please place the "fsaverage", "knn", and "FieldTrip" folders directly under the "Scrip" folder.
The group data are located in the ‘1_Group_Data’ folders under the ‘Auditory’ and ‘Picture’ folders.
