import pandas as pd
import numpy as np
import re

path = r'C:\Users\yaoz\Desktop\dataeng_test\Section_1_Data_Pipelines\Output.csv' #Change path here to write to csv

data = pd.read_csv(r"C:\Users\yaoz\Desktop\dataeng_test\dataset1.csv")
data2 = pd.read_csv(r"C:\Users\yaoz\Desktop\dataeng_test\dataset2.csv")
df = pd.concat([data,data2])


#First Preprocessing step - Removing Honorifics 
honorifics = r'(\,|\.|Mrs.|Jr.|Dr.|Mr.|MD|DVM|PhD|DDS)'
df['name'].replace(honorifics,'',regex=True, inplace=True)

#Second Preprocesing step - Removing trailing whitespaces from all columns 
df['name'] = df['name'].str.strip()


#Third Preprocessing step - Dropping NaN Values, rows where name is missing
df.dropna(subset= ['name'],inplace =True)

#Fourth Preprocesesing step - Seperating First and Last name and Honorifics
df[['first_name','last_name','honorific']] = df['name'].str.split(" ",expand = True)

#Fifth Preprocesesing step - Deleting Honorifics 
df = df.drop(['honorific','name'],axis =1)

#Sixth preprocessing step - Adding above_100, casting to numeric in pandas should remove preappended zeros already
df["price"] = pd.to_numeric(df["price"]) 
df['above_100']=  np.where(df['price']> 100, True, False)

#Final Step write to csv
df.to_csv(path,index = False)
