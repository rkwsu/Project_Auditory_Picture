‘Auditory_Cortical_Movie_Snapshots.m’ and ‘Picture_Cortical_Movie_Snapshots.m’<br>
Create videos and snapshots illustrating cortical high-gamma dynamics.<br>

‘Auditory_HGA_modulation.m’ and ‘Picture_HGA_modulation.m’<br> 
Detect significant group-level high-gamma augmentation or attenuation in each ROI.<br>

‘Auditory_FC_modulation.m’ and ‘Picture_FC_modulation.m’<br> 
Identify ROI pairs exhibiting significant simultaneous high-gamma augmentation or attenuation sustained for five or more consecutive time bins.<br>

‘Auditory_Tract_Data.m’ and ‘Picture_Tract_Data.m’<br> 
Step 1: Identify tracts located in the ‘streamline_template’ folder based on ROI pairs identified in STEP8 above.<br> 
Step 2: Adjust the opacity of white matter tracts in the generated videos.<br>

‘Auditory_DTI_Movie_Snapshots.m’ and ‘Picture_DTI_Movie_Snapshots.m’<br> 
Create videos and snapshots representing functional connectivity and coactivation networks.<br>

Additional notes: The FieldTrip toolbox is required. Please download it separately. Group data are located in the ‘1_Group_Data’ folders within the ‘Auditory’ and ‘Picture’ directories. Please place the ‘fsaverage’, ‘knn’, and ‘FieldTrip’ folders directly under the ‘Scrip’ folder.
