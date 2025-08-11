#discriptev stat
dataset.mean()
dataset['Salary'].mean()

dataset.median()
dataset['Salary'].median()

dataset['Salary'].mode()


#inferetial stat
dataset.var()
dataset['Salary'].var()

dataset['Salary'].std()


# coefficient of variation
from scipy.stats import variation
variation(dataset.values) # this will give comparison variable of entire dataframe

variation(dataset['Salary'] )


#correlation
dataset.corr()

dataset['Salary'].corr(dataset['YearsExperience'])#this will give us correlation betweend the 


#Skewness
dataset.skew()

dataset['Salary'].skew()


#standard Error
dataset.sem()

dataset['Salary'].sem()


#Z-Score
import scipy.stats as stats

dataset.apply(stats.zscore)

stats.zscore(dataset['Salary'])#this will give us Z-score of that particular column


#Degree fo Fredom
a=dataset.shape[0] #this will gives us no.of rows
b=dataset.shape[1] #this will gives us no.of columns

degree_of_freedom = a-b
print(degree_of_freedom)#this wil give us degree of freedom for entire dataset


#Sum of Squares Regresson(SSR)
y_mean = np.mean(y) 

ssr = np.sum((y_pred-y_mean)**2)
print(ssr)


#Sum of Squares Error(SSE)
y=y[0:6]
sse=np.sum((y-y_pred)**2)
print(sse)

sst = ssr + sse
print(sst)


r_square = 1-(ssr/sst)
r_square
