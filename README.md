‘Auditory_Cortical_Movie_Snapshots.m’, ‘Picture_Cortical_Movie_Snapshots.m’<br>
create videos and snapshots showing cortical high-gamma dynamics.<br>

‘Auditory_HGA_modulation.m’, ‘Picture_HGA_modulation.m’<br>
detect significant group-level high-gamma augmentation/attenuation in each ROI.<br>

‘Auditory_FC_modulation.m’, ‘Picture_FC_modulation.m’<br>
identify pairs of ROIs that exhibit significant and simultaneous high-gamma augmentation/attenuation at five or more consecutive time bins.<br>

‘Auditory_Tract_Data.m’, ‘Picture_Tract_Data.m’<br>
Step 1: Identify tracts stored in the ‘streamline_template’ folder based on the pairs of ROIs identified in STEP8 above.<br>
Step 2: Adjust the opacity of white matter tracts in the video.<br>

‘Auditory_DTI_Movie_Snapshots.m’, ‘Picture_DTI_Movie_Snapshots.m’<br>
create videos and snapshots of functional connectivity/coactivation networks.<br>

The FieldTrip toolbox is required. Please download it separately.<br>
Please place the "fsaverage", "knn", and "FieldTrip" folders directly under the "Scrip" folder.<br>
The group data are located in the ‘1_Group_Data’ folders under the ‘Auditory’ and ‘Picture’ folders.<br>

