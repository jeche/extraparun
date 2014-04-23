#Psuedocode-ish for Prediction Algorithm
#Not sure of how this will fit into the overall project due to the 
#layout of rails, as well as a lack of concrete structue at this time


#Overall idea is to normalize as much as possible for input runs, so for 
#the prediction of goals, we just have to look at the aspects specific to
#the route and not worry about the effects of other routes as much. 

#Generate a normalized mile time and extrapolate that to the conditions of
#the goal

#Should return a tuple of the climb and descent based on elevation

#Deals wit grabing points from a route and determining the elevation change
#This association has not yet been set up
def gatherDataFromRoute(route):
	pass
#The following two deal with interactions with the models and the databases
#which have not yet been set up.
def averageWithExistingRunTimes(timeSecs):
	pass
def getUserAverageMiTime():
	pass



#For every 10-degree increase in air temperature above 55 degrees, 
#there's a 1.5 percent to 3 percent increase in average finishing time

#The Factors for cold temperatures were gathered from initial research
#Will be refined and changed.
def getTempFactor(temp):
	tempFactor = 0
	if(temp > 50):
		tempDif = temp - 50;
		tempDif = tempDif/10.0
		tempFactor = (tempDif*2.25)/100
	
	elif(temp < 40):
		if(temp>=30):
			tempFactor = .0166
		elif(temp>=20 and temp <30):
			tempFactor = .03
		elif(temp >= 10 and temp < 20):
			tempFactor = .0533
		else:
			tempFactor = .0833
	else: 
		tempFactor = 0
	return timeFator
#We normalize all times to where the temperature is in the range of 40 to 55 
def normalizeForTemperature(timeSecs, temp): #both ints
	tempFactor = getTempFactor(temp)
	normalizedTime = timeSecs+(timeSecs*tempFactor)	#add in lost time
	return normalizedTime

def extrapolateForTemperature(timeSecs, temp):
	tempFactor =  getTempFactor(temp)
	extrapolatedTime = timeSecs-(timeSecs*tempFactor))
	return extrapolatedTime




#Every 100 feet of elevation gain slows you 6.6% of your average 
#one mile pace (2% grade/mile).

#Every 100 feet of elevation descent speeds you 3.6% of your 
#average one mile pace (2% grade/mile

def normalizeForElevationChange(inclElev, desElev, timeSecs):
	inclFactor = ((incElev / 100.0)*6.6)/100.0 
	descFactor = ((desElev / 100.0)*3.63)/100.0
	addTime = inclFactor * timeSecs #add lost time back
	decTime = descFactor * timeSecs # subtract gained time
	normalizedTime = timeSecs+addTime-decTime
	return normalizedTime

def extrapolateForElevationChange(inclElev, desElev, timeSecs):
	inclFactor = ((incElev / 100.0)*6.6)/100.0 
	descFactor = ((desElev / 100.0)*3.63)/100.0
	addTime = descFactor * timeSecs #add potential gained time
	decTime = inclFactor * timeSecs # subtract time lost due to hills
	extrapolatedTime = timeSecs+addTime-decTime
	return extrapolatedTime




#Base method for normalization
def mainNormalization(timeSecs, distanceMi, temp, route):
	stateTime = time; #running state of time as it goes through normalization
	elevationTup = gatherElevationFromRoute(route)
	stateTime = normalizeForTemperature(stateTime, temp)
	#Add more modules here(Those that deal with whole times)

	perMile = stateTime/distanceMi
	perMile = normalizeForElevationChange(elevationTup[0], elevationTup[1], perMile)
	#Add more modules here(Those that deal with per mile times)

	
	averageWithExistingRunTimes(perMile)

def mainExtrapolation(expTemp, route, avgPerMile):
	#perMile = getUserAverageMiTime()
	#elevationTup = gatherElevationFromRoute(route)
	perMile = extrapolateForElevationChange(route.elevationGain, route.elevationLoss, avgPerMile)
	#Add more modules here(Those that deal with per mile times)
	raise perMile.inspect
	extrapTime = perMile * route.distance.to_f
	#extrapTime = extrapolateForTemperatureChange(expTemp)  Add back in if we have temperature and date for a goal
	#Add more modules here(Those that deal with whole times)

	return extrapTime



