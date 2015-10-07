from bs4 import BeautifulSoup
import urllib2
import random

def catNameScraper():
    catNameUrl = "http://www.youpet.com/cat-names/" 

    page = urllib2.urlopen(catNameUrl).read()
    soup = BeautifulSoup(page, "lxml")
    soup.prettify()

    divs = soup.find("div", {"class": "alphabet-box"})

    catNamesList = []

    names = divs.findAll("li")
    for name in names:
        name = name.find("a").string
        catNamesList.append(name)
    return catNamesList

def cityStateScraper():
    cityUrl = "https://simple.wikipedia.org/wiki/List_of_United_States_cities_by_population"

    page = urllib2.urlopen(cityUrl).read()
    soup = BeautifulSoup(page, "lxml")
    soup.prettify()

    cityTable = soup.find("table", {'class': 'wikitable'})
    tr = cityTable.findAll("tr")
    cityStateList = []

    for row in tr:
        tds = row.findAll("td", attrs={'align': None})
        if len(tds) == 2:
            city = tds[0].string
            state = tds[1].string
            if city != None:
                cityStateList.append([city, state])
    return cityStateList

def catShelterGenerator():
    locations = cityStateScraper()
    location = random.choice(locations)
    shelterType = ['Animal Control', 'Shelter', 'Adoption Center']
    catNames = catNameScraper()
    print random.choice(catNames), random.choice(shelterType), location

for i in range(10):
    catShelterGenerator()

