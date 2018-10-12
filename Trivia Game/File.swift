//
//  File.swift
//  Trivia Game
//
//  Created by Sawyer Cherry on 10/9/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import Foundation


class TriviaQuestion {
    
    let question: String
    
    let answer: [String]
    
    let correctAnswerIndex: Int
    
    var correctAnswer: String {
        return answer[correctAnswerIndex]
}

init(question: String, answer: [String], correctAnswerIndex: Int) {
    self.question = question
    self.answer = answer
    self.correctAnswerIndex = correctAnswerIndex
    
    }
}
