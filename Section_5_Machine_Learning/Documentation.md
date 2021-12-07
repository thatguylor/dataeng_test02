# Section 5 Documentation - Machine learning using Car Evaluation Dataset 
- Data is already stored in /data 
- There are 3 formats available: PDF, HTML and ipynb
- HIGHLY recommend running in anaconda ipynb env, google colabs should be fine as well
- To AVOID viewing as PDF file, doesnt come out great :(
# What is in this directory?
- Final_Section_5_Notebook:
    * Trained classification model using decision trees
    * Model is trained on 'buying_price' as target variable as per specification
    * Dataset is tailored for use case ie; only accounting for 5 features as seen on github, and 1 target variable 
    * Accuracy is lower, reason being which is explored in this notebook.
    * Code Reference: https://www.kaggle.com/srinathsrinivasan1/car-evaluation-using-decision-trees-k-fold 
- Intermediate_Section_5_Notebook:
    * Trained 3 classification models using logistic regression, decision tree, random forest
    * Similar accuracy among all 3, random forest is highest 
    * IMPT: Model is trained on 'class' as the target variable which is how other notebooks trained their model as well. 
    * Dataset is taken as is from the original source, using all 6 features and 1 target variable - the last column which is the 'correct' feature
    * Accuracy much higher than final notebook as a result 
    * Code Reference: https://www.kaggle.com/mariosfish/car-evaluation-lr-dt-nn#Decision-tree
