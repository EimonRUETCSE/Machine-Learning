import random; 
import numpy as np;

def valueCalculation(Input,i):   
    s = 0;
    j = 0;
    l = len(Input[i]);
    j = 0;
    while(j<l):
        s = s + (2**(l-j-1)) * (ord(Input[i][j])-48);
        j = j+1;
    return s;

def sumCalculation(Input):
    s = 0;
    j = 0;
    l = len(Input);
    while(j<l):
        v = valueCalculation(Input,j);
        s = s+v;
        j = j+1;
    return s;    

def functionalSumCalculation(Input):
    s = 0;
    j = 0;
    l = len(Input);
    while(j<l):
        v = valueCalculation(Input,j);
        s = s + (v**3 + 5);
        j = j+1;
    return s; 

def maximumCalculation(Input):
    l = len(Input);
    j = 0;
    M = -10;
    while(j<l):
        v = valueCalculation(Input,j);
        if(v>M):
            M = v;
            location = j;
        j = j + 1;
    return M,location;

def sortCalculation(Input):
    
    l = len(Input);
    array = np.zeros(l);
    index = np.zeros(l);
    i=0;
    while(i<l):
        index[i] = i;
        i = i+1;
        
    j = 0;
    while(j<l):
        v = valueCalculation(Input,j);
        array[j] = v ** 3 + 5;
        j = j+1
    i=0;    
    while(i<l-1):
        j = i+1;
        while(j<l):
            if(array[i]>array[j]):
                temp = array[i];
                array[i] = array[j];
                array[j] = temp;
                
                temp = index[i];
                index[i] = index[j];
                index[j] = temp;    
            j = j+1;
        i = i+1;   
            
    return array,index;       

def fitnessCheck(Input,functionalSum):
    # applying Roultees algorithm
    
    l = len(Input);
    array = np.zeros(l);
    
    # random number generate
    
    
    # sorting the fitness
    sort_fitness,sort_index = sortCalculation(Input);
    print('\nSort_fitness = ',sort_fitness);
    print('\nSort_index = ',sort_index)
    
    # cumulative starts 
    
    i = 0;
    while(i<l-1):
        
        k = random.randint(0,functionalSum);
        cSum = 0;
        j=l-1;
        while(j>=0):
            cSum = cSum + sort_fitness[j]
            if(cSum>k):
                p = int(sort_index[j]);
                array[p] = 1;
                break;
            j = j-1;
            
        i = i+1;    
           
    return array;



#-------------- Main Function starts Here ---------------

''' Input of 5 bits '''

Input = ['10000001','01010011','10001001','11001010','01001111','11110101'];

i=0;
N_of_population = len(Input);


''' Processing 3 Generation '''

g = 0;

while(g<3):
    
    print('\n\n-------------- Generation Number = ',g+1,'-----------------');
    
    sum1 = sumCalculation(Input);
    functionalSum = functionalSumCalculation(Input);
    average = functionalSum / len(Input);
    Max_number,max_number_index = maximumCalculation(Input);
    
    print('\nSum = ',sum1,', Functional_Sum = ', functionalSum, ', Average = ',average,', Max =  ',Max_number,'\n');
    
    
    # fitness check by Roultee algorithm (Selection)
    # fitness is a Boolean vector that represents the fit or not
    fitness = fitnessCheck(Input,functionalSum);
    print('\nPosition of Selecting Chorosome : ',fitness) 
    
    j=0;
    while(j < (len(Input)-1)):
        if(fitness[j] == 0):
            Input[j] = Input[random.randint(0,len(Input)-1)];
        j = j+1;
    
    
    # Crossing ---------------------
    # let crossing point = 1 point crossing ------------------
    l = len(Input[0]);
    print('\nBefore Crossing : ',Input);
    
    
    while(i< N_of_population):
        #value = valueCalculation(Input,i);
        #print('\n',value,'\t',value **2) ;
        
        # Random number generation for crossing
        k = random.randint(0, len(Input[0])-1);
        print('K = ',k);
        
        # Swaping
        temp1 = Input[i][k];
        temp2 = Input[i+1][k];
        Input[i] = Input[i][:k] + temp2 + Input[i][k+1:];
        Input[i+1] = Input[i+1][:k] + temp1 + Input[i+1][k+1:];
        
        i = i+2;
           
    print('\nAfter Crossing  : ',Input);
    
    
    # ----------------- Mutation ----------------------------------
    
    # Random number generation
    k1 = random.randint(0, (N_of_population - 1));
    k2 = random.randint(0, len(Input[0])-1);
    print('\nk1 = ',k1,', k2 = ',k2);
    
    # update Input by Mutation
    if(Input[k1][k2] == '1'):   
        Input[k1] = Input[k1][:k2] + '0' + Input[k1][k2+1:];   
    else:
        Input[k1] = Input[k1][:k2] + '1' + Input[k1][k2+1:]; 
            
    print('\nAfter Mutation  : ',Input);
    
    g = g+1;


 






















   