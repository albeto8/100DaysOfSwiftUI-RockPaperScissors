//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mario Alberto Barragán Espinosa on 20/10/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let maxScore = 10
    @State private var playerScore = 0
    @State private var currentQuestion = 0
    
    private var moves = ["Rock", "Paper", "Scissors"]
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        VStack {
            Text("Player score: \(playerScore)")
            Text("Question: \(currentQuestion) / \(maxScore)")
            Text("Current move: \(moves[appMove])")
            Text("You must \(shouldWin ? "Win" : "Loose")")
            
            ForEach(moves, id: \.self) { move in
                MoveButton(text: move) {
                    self.moveSelected(userMove: move)
                }
            }

        }.alert(isPresented: $showingScore) {
          Alert(title: Text(scoreTitle), message: Text("Your score is \(playerScore)"), dismissButton: .default(Text("Continue")) {
            if self.currentQuestion >= self.maxScore {
                self.playerScore = 0
                self.currentQuestion = 0
              }
              self.askQuestion()
            })
        }
    }
    
    func moveSelected(userMove: String) {
        let currentMove = (moves[appMove])
        // TODO: Improve algorithm
        if currentMove == userMove {
            playerScore -= 1
        } else if shouldWin {
            if currentMove == "Rock" && userMove == "Paper" {
                playerScore += 1
            } else if currentMove == "Paper" && userMove == "Scissors" {
                playerScore += 1
            } else if currentMove == "Scissors" && userMove == "Rock" {
                playerScore += 1
            } else {
                playerScore -= 1
            }
        } else {
            if currentMove == "Rock" && userMove == "Paper" {
                playerScore -= 1
            } else if currentMove == "Paper" && userMove == "Scissors" {
                playerScore -= 1
            } else if currentMove == "Scissors" && userMove == "Rock" {
                playerScore -= 1
            } else {
                playerScore += 1
            }
        }
        currentQuestion += 1
        showingScore = true
    }
    
    func askQuestion() {
        appMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
