//
//  QuestionView.swift
//  Code History
//
//  Created by Christophe Thomassin on 1/17/25.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var gameView: GameViewModel
    let question: Question
    
    var body: some View {
        GeometryReader { geometry in
            let blockSize = geometry.size.width / 2 - 40
            VStack {
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    Spacer()
                    Grid {
                        GridRow {
                            ForEach(0..<2) { answerIndex in
                                button(
                                    index: answerIndex,
                                    size: blockSize
                                )
                            }
                        }
                        GridRow {
                            ForEach(2..<4) { answerIndex in
                                button(
                                    index: answerIndex,
                                    size: blockSize
                                )
                            }
                        }
                    }
                    .padding()
                    Spacer()
                    }
                if gameView.guessWasMade {
                    Button(action: {gameView.displayNextScreen() }
                    ) {
                        BottomTextView(str: "Next")
                }
                }
            }
        }
    }
    
    func button(index: Int, size: CGFloat) -> some View {
        Button(action: {
            gameView.makeGuess(atIndex: index)
        }, label: {
            Text(question.possibleAnswers[index])
                .font(.body)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: size, height: size)
                .border(GameColor.accentColor, width: 6)
        }

        )
        .background(gameView.color(forOptionsNext: index))
        .disabled(gameView.guessWasMade)
    }
}

#Preview {
    QuestionView(question: Game().currentQuestion)
}
