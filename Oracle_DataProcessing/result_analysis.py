import glob
import csv
arr=[]
count=0
path = "C:\Users\stefa\Desktop\Work\*.csv"
for fname in glob.glob(path):
    with open(fname, 'r') as csvFile:
        reader = csv.reader(csvFile)
        
        for row in reader:
            if len(row)>0 and row[0]!="PL/SQL procedure successfully completed." and float(row[0])>0:
                count+=1
                arr.append(float(row[0]))

print "the count of total query files is "+ str(len(arr))                
print "total execution time is "+str(sum(arr))+" seconds"
