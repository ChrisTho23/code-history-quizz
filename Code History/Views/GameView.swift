//
//  GameView.swift
//  Code History
//
//  Created by Christophe Thomassin on 1/15/25.
//

import SwiftUI

struct GameView: View {
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
        correctAnswerIndex: 2
    )
    @StateObject var gameView = GameViewModel()
    @State private var isGameOver: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                GameColor.mainColor.ignoresSafeArea()
                VStack {
                    Text(gameView.questionProgressText)
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .padding()
                    QuestionView(question: gameView.currentQuestion)
                }
            }
            .foregroundColor(.white)
            .navigationBarHidden(true)
            .environmentObject(gameView)
            .onChange(of: gameView.gameIsOver) { _, newValue in
                isGameOver = newValue
            }
            .navigationDestination(isPresented: $isGameOver) {
                ScoreView(scoreView: ScoreViewModel(correctGuesses: gameView.correctGuesses, incorrectGuesses: gameView.incorrectGuesses))
            }
        }
    }
}

#Preview {
    GameView()
}
