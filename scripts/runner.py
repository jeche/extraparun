import urllib2
input_f = open("bostonHalfResults.txt", 'r')
count = 1
femList = []
dist = 
date = 
humidity = 
name = 
for line in input_f:
	listo = line.split()
	if(len(listo) >= 11):
		if listo[0].strip() == str(count):
			# listo[4] # net time
			# listo[7] # age
			femList.append({'hr':listo[4].strip().split(':')[0],'min':listo[4].strip().split(':')[1],'sec':listo[4].strip().split(':')[2], "dist":dist, "date":date, "name":name, "humidity":humidity})
			count += 1
input_f.close()

print(femList)