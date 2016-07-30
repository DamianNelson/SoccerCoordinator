import Foundation


// 1. Manually create a single collection that contains all information for all 18 players. Each player should themselves be represented by their own collection.

//Every player gets their own dictionary

let joeSmith = ["Name": "Joe Smith", "height": 42, "experienced": true, "guardians": "Jim and Jan Smith"]
let jillTanner = ["Name": "Jill Tanner", "height": 36, "experienced": true, "guardians": "Clara Tanner"]
let billBon = ["Name": "Bill Bon", "height": 43, "experienced": true, "guardians": "Sara and Jenny Bon"]
let evaGordon = ["Name": "Eva Gordon", "height": 45, "experienced:": false, "guardians": "Wendy and Mike Gordon"]
let mattGill = ["Name": "Matt Gill", "height": 40, "experienced": false, "guardians": "Charles and Sylvia Gill"]
let kimmyStein = ["Name": "Kimmy Stein","height": 41, "experienced": false, "guardians": "Bill and Hillary Stein"]
let sammyAdams = ["Name": "Sammy Adams","height": 45, "experienced": false, "guardians": "Jeff Adams"]
let karlSagan = ["Name": "Karl Sagan", "height": 42, "experienced": true, "guardians": "Heather Bledsoe"]
let suzanneGreenberg = ["Name": "Suzane Greenberg", "height": 44, "experienced": true, "guardians": "Henrietta Dumas"]
let salDali = ["Name": "Sal Dali", "height": 41, "experienced": false, "guardians": "Gala Dali"]
let joeKavalier = ["Name": "Joe Kavalier", "height": 39, "experienced": false, "guardians": "Sam and Elaine Kavalier"]
let benFinkelstein = ["Name": "Ben Finkelstein", "height": 44, "experienced": false, "guardians": "Aaron and Jill Finkelstein"]
let diegoSoto = ["Name": "Diego Soto", "height": 41, "experienced": true, "guardians": "Robin and Sarika Soto"]
let chloeAlaska = ["Name": "Chloe Alaska", "height": 47, "experienced": false, "guardians": "David and Jamie Alaska"]
let arnoldWillis = ["Name": "Arnold Willis", "height": 43, "experienced": false, "guardians": "Claire Willis"]
let phillipHelm = ["Name": "Phillip Helm", "height": 44, "experienced": true, "guardians": "Thomas Helm and Eva Jones"]
let lesClay = ["Name": "Les Clay", "height": 42, "experienced": true, "guardians": "Wynonna Brown"]
let herschelKrustofski = ["Name": "Herschel Krustofski", "height": 45, "experienced": true, "guardians": "Hyman and Rachel Krustofski"]

//Storing dictionaries in an array...

let totalRoster = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSagan, suzanneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]


// 2. Create appropriate variables and logic to sort and store players into three teams: Sharks, Dragons and Raptors. Be sure that your logic results in all teams having the same number of experienced players on each.

//create empty experienced and inexperienced player variables, iterate through roster and raise count with each player

var totalExperiencedPlayers = 0

for player in totalRoster {
    if player["experienced"] == true {
        totalExperiencedPlayers += 1
    }
}

var totalInexperiencedPlayers = 0

for player in totalRoster {
    if player["experienced"] == false {
        totalInexperiencedPlayers += 1
    }
}


//establishing maximum amount of experienced players

let maxExperiencedPlayers = totalExperiencedPlayers / 3

var experiencedPlayers: [[String : NSObject]] = []
var inexperiencedPlayers:[[String : NSObject]] = []

//creating pool of experienced and inexperienced players

for player in totalRoster {
    if player["experienced"] == true {
        experiencedPlayers.append(player)
    } else {
        inexperiencedPlayers.append(player)
    }
}

//initiate a function for distributing experienced players

func distributeExperiencedPlayers(team: NSMutableArray) {
    while team.count < maxExperiencedPlayers {
        team.addObject(experiencedPlayers[0])
        experiencedPlayers.removeFirst()
    }
}




var sharks: NSMutableArray = []
var dragons: NSMutableArray = []
var raptors: NSMutableArray = []


distributeExperiencedPlayers(sharks)
distributeExperiencedPlayers(dragons)
distributeExperiencedPlayers(raptors)

//same thing but for inexperienced players

func distributeInexperiencedPlayers(team: NSMutableArray) {
    while team.count < totalRoster.count/3 {
        team.addObject(inexperiencedPlayers[0])
        inexperiencedPlayers.removeFirst()
    }
}

distributeInexperiencedPlayers(sharks)
distributeInexperiencedPlayers(dragons)
distributeInexperiencedPlayers(raptors)

//checking to see if everything went smoothly...



print(sharks)
print(dragons)
print(raptors)



//these should be empty



experiencedPlayers
inexperiencedPlayers



//and they are! *pops champagne prematurely*


    




// 3. Provide logic that prints a personalized letter to the guardians specifying: the player’s name, guardians' names, team name, and date/time of their first team practice. The letters should be visible when code is placed in a XCode Playground or run in an XCode project.

///////////////// SAMPLE LETTER //////////////////
/*
 Dear (Parent/Guardian), 
 Congratulations, your  child (childname) after a rigorous audition which few children actually survived, has been assigned to the team (teamname). We eagerly await to see you on the field at our first practice 4pm on Saturday, July 30th.
 
 Sincerely,
 Treehouse Soccer Academy
 
 */

// The team practice dates/times are as follows: Dragons - March 17, 1pm, Sharks - March 17, 3pm, Raptors - March 18, 1pm

func personalizedLetters(team: NSArray) {
    
    var teamName = ""
    var practiceTime = ""
    if team == sharks {
        teamName = "Sharks"
        practiceTime = "March 17, 3pm"
    } else if team == dragons {
        teamName = "Dragons"
        practiceTime = "March 17, 1pm"
    } else {
        teamName = "Raptors"
        practiceTime = "March 18, 1pm"
    }
    
    for player in team {
        print("Dear \(player["guardians"]!!), \n Congratulations, after a rigorous audition which few survived, your child \(player["Name"]!!) has been assigned to the \(teamName). We eagerly await to see you on the field at our first practice \(practiceTime). \n Sincerely, \n Treehouse Soccer Academy")
    }
}

// Making the letters!

personalizedLetters(sharks)
personalizedLetters(dragons)
personalizedLetters(raptors)

//I'm not sure exactly why every time I pull information out of the player dictionaries it comes back as Optional, maybe it has something to do with the fact I used the foundation framework... I hope that was legal!


