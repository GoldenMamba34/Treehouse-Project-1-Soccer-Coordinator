import UIKit

var players = [
    ["name": "Joe Smith", "age": 42, "experience":true, "guardians" : "Jim and Jan Smith"]
    ,["name" : "Jill Tanner", "age":36,"experience":true, "guardians": "Clara Tanner"]
    , ["name":"Bill Bon","age": 36, "experience": true, "guardians": "Sara and Jenny Bon"]
    , ["name": "Eva Gordan", "age": 35, "experience": false, "guardians": "Wendy and Mike Gordan"]
    , ["name": "Mat Gill", "age": 40, "experience": false, "guardians": "Charles and Sylvia Gill"]
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
// An array that holds the data for each player

var teams = [[], [], []] // array holding the 3 teams


var teamSharks =  [Any]()
var teamDragons = [Any]()
var teamRaptors = [Any]()

// Arrays for each of the 3 teams

var letters = [String]() // variable storing all of the letters


func getPlayerTeamFromNumber(teamNumber: Int) -> String { // Gets the name of the team the player is on by taking in the index that team is in the "teams" variable
    var playersTeam = ""
    switch teamNumber {
    case 0: playersTeam = "Sharks"
    case 1: playersTeam = "Dragons"
    default: playersTeam = "Raptors"
    }
    return playersTeam
}
func sortPlayers() { // Sorts all of the players into their respective teams
    var experiencedPlayers = [[String: Any]]() // Array storing all of the experienced players
    var unexperiencedPlayers = [[String: Any]]() // Array storing all of the unexperienced players
    for i in 0...players.count - 1 { // Assigns players to either the experiencedPlayers array for experienced players or the unexperiencedPlayers array for unexperienced players
        
        if players[i]["experience"] as? Bool == true {
            experiencedPlayers.append(players[i])
        }
        else {
            unexperiencedPlayers.append(players[i])
        }
    }
    var index = 0
    for experiencedPlayer in experiencedPlayers  { // Assigns experienced players to their respective teams
        var copyOfExperiencedPlayersArray = experiencedPlayers
        
        copyOfExperiencedPlayersArray[index]["team"] = getPlayerTeamFromNumber(teamNumber: index % teams.count)
        teams[index % teams.count].append(copyOfExperiencedPlayersArray[index])
        
        copyOfExperiencedPlayersArray.remove(at: index)
        index += 1
        if index > experiencedPlayers.count - 1 {
            experiencedPlayers = copyOfExperiencedPlayersArray
        }
    }
    index = 0
    for unexperiencedPlayer in unexperiencedPlayers  { // Assigns unexperienced players to their respective teams
        var copyOfUnexperiencedPlayersArray = unexperiencedPlayers
        copyOfUnexperiencedPlayersArray[index]["team"] = getPlayerTeamFromNumber(teamNumber: index % teams.count)

        teams[index % teams.count].append(copyOfUnexperiencedPlayersArray[index])
        copyOfUnexperiencedPlayersArray.remove(at: index)
        index += 1
        if index > unexperiencedPlayers.count - 1 {
            unexperiencedPlayers = copyOfUnexperiencedPlayersArray
        }
    }
    
    teamSharks = teams[0]
    teamDragons = teams[1]
    teamRaptors = teams[2]
    // Assigns each team array it's players
}

func createLetters() {
    
    func getPlayerPracticeTime(playerTeam: String) -> String {// Takes in a player's team as String and returns that team's first practice time in the form of a String
        var practiceTime = ""
        switch playerTeam {
        case "Sharks": practiceTime = "March 17th, 1pm"
        case "Dragons": practiceTime = "March 17th, 3pm"
        case "Raptors": practiceTime = "March 18th, 1pm"
        default: break
        }
        return practiceTime
    }

    for player in teamSharks + teamDragons + teamRaptors as! [[String: Any]] { // Creates the letters
        
        letters.append("""
               Dear \(player["guardians"]!),
                Your child \(player["name"]!) has been placed on team \(player["team"]!), practices start \(getPlayerPracticeTime(playerTeam: player["team"] as! String))
            """
        )
    }
    
}
sortPlayers()
createLetters()

for letter in letters {
    print(letter)
} // Prints the letters

