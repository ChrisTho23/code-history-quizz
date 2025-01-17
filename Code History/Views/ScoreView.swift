//
//  ScoreView.swift
//  Code History
//
//  Created by Christophe Thomassin on 1/17/25.
//

import SwiftUI

struct ScoreView: View {
    let scoreView: ScoreViewModel
    
    var body: some View {
        ZStack {
            GameColor.mainColor.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Final Score")
                    .font(.body)
                Text("\(scoreView.percentage)%")
                  .font(.system(size: 50))
                  .bold()
                  .padding()
                Spacer()
                VStack {
                    Text("\(scoreView.correctGuesses) ✅")
                    Text("\(scoreView.incorrectGuesses) ❌")
                }
                .font(.system(size: 30))
                Spacer()
                NavigationLink(
                    destination: GameView(),
                    label: { BottomTextView(str: "Retake Quiz") }
                )
            }
            .foregroundColor(.white)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ScoreView(scoreView: ScoreViewModel(correctGuesses: 8, incorrectGuesses: 2))
}
