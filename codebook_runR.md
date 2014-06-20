run analysis R programing 
========================================================
setting work directory
-------------------------------------------------------
seting work directory to /home/frank/Rananlysis

load data into R
--------------------------------------------------------
### input data into R funciton DIdata

#### loading trainning dataset
        
        *T_lables object is trainning lables dataset(y_train dataset)

        *X_train_data object is training dataset (x_train dataset)

        *sub_train object is performed activity for traing by each volunteer dataset(subject_train dataset)

#### loading testing dataset

        *sub_test object is testing lables dataset(subject_train dataset)
        
        *X_test_data object is testing dataset(x_test dataset)
        
        *TS_lables object is performed activity for testing by each volunteer dataset(y_test dataset)
        
#### loading features dataset
        *features object is List of all features
### combine X_traing dataset 
add training lables(y_training) and subject_train into trainning dataset(x_train) as colnums
#### mapping activity name and trainning lables
addAName function add activity name into training lables dataset by activity name number in trainning lables dataset
#### trainning dataset and testing dataset
        *train_data is trainning dataset include all trainning data and traning lables and activity name
        *testing_data is testing dataset include all trainning data and traning lables and activity name
#### get all dataset
        *all_data is all dataset include trainning data and testing data
#### name activity and variable name 
        *VNum is volunteer number
#### extract all mean and std of all measurement
        *col_mean colnum number vector of all include mean
        *col_std colnum number vector of all include std
        *col_num clonum number vector of all include mean or std in all_data dataset
        *mean_std_data mean and std dataset
#### creat a second dataset of each variable for each activity and each subject
        *mean_vas is another dataset for each activity and each subject

