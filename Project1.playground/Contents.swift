import UIKit

var players = [["Joe Smith", 42, true, "Jim and Jan Smith"],["Jill Tanner", 36, true, "Clara Tanner"], ["Bill Bon", 36, true, "Sara and Jenny Bon"], ["Eva Gordan", 35, false, "Wendy and Mike Gordan"], ["Mat Gill", 40, false, "Charles and Sylvia Gill"], ["Kimmy Stein", 41, false, "Bill Hillary Stein"],["Sammt Adams", 45, false, "Jeff Adams"], ["Karl Saygan", 42, true,"Heather Bledsoe"],["Suzane Greenburg", 44, true, "Henrietta Dumas"], ["Sal Dali", 41, false, "Gala Dali"],["Joe Kavalier", 39, false, "Sam and Elaine Kavalier"],["Ben Finkelstein", 44, false, "Aaron and Jill Finkelstein"], ["Diego Soto", 42, true, "Robin and Sarika Soto"], ["Chloe Alaska", 47, false, "David and Jamie Alaska"], ["Arnold Willis", 43, false, "Claire Willis"], ["Phillip Helm", 44, true, "Thomad Helm and Eva Jones"], ["Les Clay", 42, true, "Wynonna Brown"], ["Herschel Krustofski",45, true, "Hyman and Rachel Krustofski"]]

var teams = [[], [], []]
var teamSharks =  [Any]()
var teamDragons = [Any]()
var teamRaptors = [Any]()
var letters = [String]()

func sortPlayers() {
    
    var lastTeamExperiencedPlayerAddedTo = 0
    var lastTeamUnexperiencedPlayerAddedTo = 0
    var index = 0
    for player in players {
        
        if player[2] as? Bool == true {
            players[index].append(lastTeamExperiencedPlayerAddedTo)
            teams[lastTeamExperiencedPlayerAddedTo].append(players[index])
            
            
            lastTeamExperiencedPlayerAddedTo += 1
            if lastTeamExperiencedPlayerAddedTo == 3 {
                lastTeamExperiencedPlayerAddedTo = 0
            }
        }
            
        else {
            players[index].append(lastTeamUnexperiencedPlayerAddedTo)
            teams[lastTeamUnexperiencedPlayerAddedTo].append(players[index])
            
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
            Dear \(player[3]),
            Your child \(player[0]) has been placed on team \(player[3]), practices start \(getPlayerPracticeTime(playerTeam: player[4] as! Int))
            
            """
        )
    }
    
}
sortPlayers()
createLetters()
print(letters)

