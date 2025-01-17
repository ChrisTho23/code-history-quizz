//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Christophe Thomassin on 1/17/25.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int

    var percentage: Int {
        return (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
