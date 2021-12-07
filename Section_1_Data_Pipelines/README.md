# Section 1 Documentation - Data Pipelines
- Execute.py is the main script and workflow for data processing
- Output.csv is the obtained processed data file stored in this directory 
- Preprocessing.ipynb is the same as Execute except in a .ipynb so you can see step by step the data processed 
- input data is stored in ../dataset1.csv and ../dataset2.csv
- Because i am running in a windows environment, cron and airflow are not available to me and because of time constraints, i did not spin up a docker container including the scheduler. 
- Hence, windows provides a GUI and tool called windowstaskscheduler to automate this exact processes. You can see it from the screenshot in this folder.
- After checking with the hiring team, they have said this is not that big a deal :) 

# How to Use? 
* You must first edit `Execute.py` and change the settings so that your path directory matches inside the script. 
* After that, either using VS Studio, hit run or use cmd/shell/terminal to run `Execute.py`
* You dont need any external libraries except for standard pandas, regex etc. 

# Data Preprocessing Steps:
-  Step 1: Removing Honorifics using Regex:
    * Search each column in the `name` for preappended and appended honorifics 
    * Remove them if found 
-  Step 2: Remove trailing whitespaces from `name` 
-  Step 3: Drop NaN values in `name` column - Remove rows where `name` is missing 
-  Step 4: Seperate First and Last Name and Number Honorifics 
-  Step 5: Delete Number Honorifics like III 
-  Step 6: Adding `above_100` column, by casting price to numeric in pandas, this should remove preappended zeroes
-  Step 7: Write to csv. Make sure to change filepath!

# Future Improvement?
* After learning about Docker this test, i might ship the entire script in a UNIX environment to activate Apache Airflow and/or Cron.
* Also, do note that the Execute Script is not foolproof. If the Input data were to change column headers, or give an unexpected Honorific for eg. The script needs to be modified. In future can think of ways to catch even more exceptions. 

 
