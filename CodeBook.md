Variables in tidydata.txt dataset
---------------------------------

The final dataset has 69 variables. The first 3 are:

#### set\_type

Indicates if the observation is from the train or the test set.
Factor variable with two possible values:

-   train
-   test

#### subject

Unique identifier of study subjects.
Integer variable, range \[1-30\].

#### activity

Type of activity.
Factor variable with 6 possible values:

-   WALKING
-   WALKING\_UPSTAIRS
-   WALKING\_DOWNSTAIRS
-   SITTING
-   STANDING
-   LAYING

### Signal variables

The remain 66 variables are the averages, by subject and activity, of variables in the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
We are not going to explain them one by one. However they are named in a self-explanatory way. Each variable name has 6 different components separated by "\_":

1.  **Type of signal:** Could be a Body signal or a Gravity signal
2.  **Type of tool:** If the signal was recorded by the accelerometer ("acc") or by the gyroscope ("gyro").
3.  **Jerk signal:** If the signal was derived in time ("jerk") or not ("nojerk").
4.  **Type of axis:** The axis of the signal ("X"","Y"" or "Z""), or if the magnitude was calculated using the euclidean norm of the 3 signals ("mag").
5.  **Fourier tansformation:** If a fast fourier transformation was applied to the signal ("f") or not ("t").
6.  **Type of statistic** Statictic used to calculate the original variable, mean ("mean") or standard deviation ("std").

Example: `Gravity_acc_nojerk_Z_t_mean`

### Complete list of variables:

    ##  [1] "set_type"                      "subject"                      
    ##  [3] "activity"                      "Body_acc_nojerk_X_t_mean"     
    ##  [5] "Body_acc_nojerk_Y_t_mean"      "Body_acc_nojerk_Z_t_mean"     
    ##  [7] "Body_acc_nojerk_X_t_std"       "Body_acc_nojerk_Y_t_std"      
    ##  [9] "Body_acc_nojerk_Z_t_std"       "Gravity_acc_nojerk_X_t_mean"  
    ## [11] "Gravity_acc_nojerk_Y_t_mean"   "Gravity_acc_nojerk_Z_t_mean"  
    ## [13] "Gravity_acc_nojerk_X_t_std"    "Gravity_acc_nojerk_Y_t_std"   
    ## [15] "Gravity_acc_nojerk_Z_t_std"    "Body_acc_jerk_X_t_mean"       
    ## [17] "Body_acc_jerk_Y_t_mean"        "Body_acc_jerk_Z_t_mean"       
    ## [19] "Body_acc_jerk_X_t_std"         "Body_acc_jerk_Y_t_std"        
    ## [21] "Body_acc_jerk_Z_t_std"         "Body_gyro_nojerk_X_t_mean"    
    ## [23] "Body_gyro_nojerk_Y_t_mean"     "Body_gyro_nojerk_Z_t_mean"    
    ## [25] "Body_gyro_nojerk_X_t_std"      "Body_gyro_nojerk_Y_t_std"     
    ## [27] "Body_gyro_nojerk_Z_t_std"      "Body_gyro_jerk_X_t_mean"      
    ## [29] "Body_gyro_jerk_Y_t_mean"       "Body_gyro_jerk_Z_t_mean"      
    ## [31] "Body_gyro_jerk_X_t_std"        "Body_gyro_jerk_Y_t_std"       
    ## [33] "Body_gyro_jerk_Z_t_std"        "Body_acc_nojerk_mag_t_mean"   
    ## [35] "Body_acc_nojerk_mag_t_std"     "Gravity_acc_nojerk_mag_t_mean"
    ## [37] "Gravity_acc_nojerk_mag_t_std"  "Body_acc_jerk_mag_t_mean"     
    ## [39] "Body_acc_jerk_mag_t_std"       "Body_gyro_nojerk_mag_t_mean"  
    ## [41] "Body_gyro_nojerk_mag_t_std"    "Body_gyro_jerk_mag_t_mean"    
    ## [43] "Body_gyro_jerk_mag_t_std"      "Body_acc_nojerk_X_f_mean"     
    ## [45] "Body_acc_nojerk_Y_f_mean"      "Body_acc_nojerk_Z_f_mean"     
    ## [47] "Body_acc_nojerk_X_f_std"       "Body_acc_nojerk_Y_f_std"      
    ## [49] "Body_acc_nojerk_Z_f_std"       "Body_acc_jerk_X_f_mean"       
    ## [51] "Body_acc_jerk_Y_f_mean"        "Body_acc_jerk_Z_f_mean"       
    ## [53] "Body_acc_jerk_X_f_std"         "Body_acc_jerk_Y_f_std"        
    ## [55] "Body_acc_jerk_Z_f_std"         "Body_gyro_nojerk_X_f_mean"    
    ## [57] "Body_gyro_nojerk_Y_f_mean"     "Body_gyro_nojerk_Z_f_mean"    
    ## [59] "Body_gyro_nojerk_X_f_std"      "Body_gyro_nojerk_Y_f_std"     
    ## [61] "Body_gyro_nojerk_Z_f_std"      "Body_acc_nojerk_mag_f_mean"   
    ## [63] "Body_acc_nojerk_mag_f_std"     "Body_acc_jerk_mag_f_mean"     
    ## [65] "Body_acc_jerk_mag_f_std"       "Body_gyro_nojerk_mag_f_mean"  
    ## [67] "Body_gyro_nojerk_mag_f_std"    "Body_gyro_jerk_mag_f_mean"    
    ## [69] "Body_gyro_jerk_mag_f_std"
