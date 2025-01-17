//
//  Game.swift
//  Code History
//
//  Created by Christophe Thomassin on 1/16/25.
//

import Foundation

struct Game {
    private(set) var currentQuestionIndex: Int = 0
    private(set) var guesses = [Question: Int]()
    private(set) var isOver: Bool = false
    private let questions = Question.allQuestions.shuffled()
    
    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0, 0)
        for (question, guessedIndex) in guesses {
            if guessedIndex == question.correctAnswerIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }
    
    var numberOfQuestions: Int {
        questions.count
    }
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    mutating func makeGuessForCurrentQuestion(atIndex index: Int) {
        guesses[currentQuestion] = index
    }
    
    mutating func updateGameStatus() {
        if currentQuestionIndex == questions.count - 1 {
            isOver = true
        } else {
            currentQuestionIndex += 1
        }
    }
}
