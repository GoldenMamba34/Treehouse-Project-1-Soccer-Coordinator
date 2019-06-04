import UIKit

var players = [
    ["name": "Joe Smith", "age": 42, "experience":true, "guardians" : "Jim and Jan Smith"]
    ,["name" : "Jill Tanner", "age":36,"experience":true, "guardians": "Clara Tanner"]
    , ["name":"Bill Bon","age": 36, "experience": true, "guardians": "Sara and Jenny Bon"]
    , ["name": "Eva Gordan", "age": 35, "experience": false, "guardians": "Wendy and Mike Gordan"]
    , ["name": "Mat Gill", "age": 40, "experience": false, "guardian": "Charles and Sylvia Gill"]
    , ["name": "Kimmy Stein", "age": 41, "experience": false, "guardians": "Bill Hillary Stein"]
    ,["name": "Sammt Adams", "age": 45, "experience": false, "guardians": "Jeff Adams"]
    , ["name": "Karl Saygan", "age": 42, "experience": true,"guardians": "Heather Bledsoe"]
    ,["name": "Suzane Greenburg", "age": 44, "experience": true, "guardians": "Henrietta Dumas"]
    , ["name": "Sal Dali", "age": 41, "experience": false, "guardians": "Gala Dali"]
    ,["name": "Joe Kavalier", "age": 39, "experience": false, "guardians": "Sam and Elaine Kavalier"]
    ,["name": "Ben Finkelstein", "age": 44, "experience": false, "guardians": "Aaron and Jill Finkelstein"]
    , ["name": "Diego Soto", "age": 42, "experience": true,"guardians": "Robin and Sarika Soto"]
    , ["name": "Chloe Alaska", "age": 47, "experience": false, "guardians": "David and Jamie Alaska"]
    , ["name": "Arnold Willis", "age": 43, "experience": false, "guardians": "Claire Willis"]
    , ["name": "Phillip Helm", "age": 44, "experience": true, "guardians": "Thomad Helm and Eva Jones"]
    , ["name": "Les Clay", "age": 42, "experience": true, "guardians": "Wynonna Brown"]
    , ["name": "Herschel Krustofski","age": 45, "experience": true, "guardians": "Hyman and Rachel Krustofski"]
]

var teams = [[], [], []]
var teamSharks =  [Any]()
var teamDragons = [Any]()
var teamRaptors = [Any]()
var letters = [String]()
var index = 0
func sortPlayers() {
    
    var lastTeamExperiencedPlayerAddedTo = 0
    var lastTeamUnexperiencedPlayerAddedTo = 0
    for player in players {
        
        if player["experience"] as? Bool == true {
players[index]["team"] = lastTeamExperiencedPlayerAddedTo
            print(player)
 teams[lastTeamUnexperiencedPlayerAddedTo].append(player)
            lastTeamExperiencedPlayerAddedTo += 1
            if lastTeamExperiencedPlayerAddedTo == 3 {
                lastTeamExperiencedPlayerAddedTo = 0
            }
        }
            
        else {
players[index]["team"] = lastTeamUnexperiencedPlayerAddedTo
            teams[lastTeamUnexperiencedPlayerAddedTo].append(player)
            
            lastTeamUnexperiencedPlayerAddedTo += 1
            
            if lastTeamUnexperiencedPlayerAddedTo == 3 {
                lastTeamUnexperiencedPlayerAddedTo = 0
            }
        }
   
       index += 1
    }
    teamSharks = teams[0]
    teamDragons = teams[1]
    teamRaptors = teams[2]
}

func createLetters() {
    
    func getPlayerPracticeTime(playerTeam: Int) -> String {
        var practiceTime = ""
        switch playerTeam {
        case 0: practiceTime = "March 17th, 1pm"
        case 1: practiceTime = "March 17th, 3pm"
        case 2: practiceTime = "March 18th, 1pm"
        default: break
        }
        return practiceTime
    }
    
    for player in players {
        
        letters.append("""
            Dear \(player["guardians"]),
            Your child \(player["name"]) has been placed on team \(player["guardians"]), practices start \(getPlayerPracticeTime(playerTeam: player["team"] as! Int))
            
            """
        )
    }
    
}
sortPlayers()
createLetters()
print(letters)

