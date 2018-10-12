//
//  ViewController.swift
//  Trivia Game
//
//  Created by Sawyer Cherry on 10/8/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var choiceFour: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var scoreLabe: UILabel!
    var currentQuestion: TriviaQuestion! {
        didSet {
            questionLabel.text = currentQuestion.question
            choiceOne.setTitle(currentQuestion.answer[0], for: .normal)
            choiceTwo.setTitle(currentQuestion.answer[1], for: .normal)
            choiceThree.setTitle(currentQuestion.answer[2], for: .normal)
            choiceFour.setTitle(currentQuestion.answer[3], for: .normal)
        }
    }
    
    var questions: [TriviaQuestion] = []
    
    var doneDidQuestions: [TriviaQuestion] = []
    
    var randomIndex: Int!
    
    var score = 0 {
        //IpsumFuckit
        didSet {
            scoreLabe.text = "\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateQuestions()
        getNewQuestion()
        
        let newAlert = UIAlertController(title: "Hello", message: "Welcome to Classic Rock Trivia", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        newAlert.addAction(closeAction)
        self.present(newAlert, animated: true, completion: nil)
        
        
    }
    
    func populateQuestions() {
        
        let question1 = TriviaQuestion(question: "What Year did Led Zeppelin release Led Zeppelin I?", answer: ["1972", "1969", "1970", "1971"], correctAnswerIndex: 1)
        let question2 = TriviaQuestion(question: "Where is SRV's Style", answer: ["Blues", "Twang", "Blues-Rock", "Double-Trouble"], correctAnswerIndex: 2)
        let question3 = TriviaQuestion(question: "Which song is from Black Sabbath?", answer: ["The Wizard", "Smoke On The Water", "Rat Sandwitch","Highway Haazard"], correctAnswerIndex: 0)
        let question4 = TriviaQuestion(question: "Who is the drummer of Led Zeppelin?", answer: ["John Bonham", "Lars Ulrich", "Vinnie Paul", "Tommy Lee"], correctAnswerIndex: 0)
        let question5 = TriviaQuestion(question: "What was Tom Petty's first band's name?", answer: ["Ramp", "Mud Huney", "County Proud", "Mud Crutch"], correctAnswerIndex: 3)
        let question6 = TriviaQuestion(question: "Who played lead guitar for The Beatles", answer: ["Ringo", "Paul McCartney", "John Lennon", "George Harrison"], correctAnswerIndex: 2)
        let question7 = TriviaQuestion(question: "What Band is Bon Scott from?", answer: ["GNR", "Deep Purple", "Rush", "AC⚡️DC"], correctAnswerIndex: 3)
        let question8 = TriviaQuestion(question: "Who played bass originally for GNR?", answer: ["Duff McKagan", "Geddy Lee", "Flea", "Gene Simmons"], correctAnswerIndex: 0)
        let question9 = TriviaQuestion(question: "Who came up with the rift for crazy train?", answer: ["Ozzy Osbourne", "Saul Hudson", "Zakk Wylde", "Randy Rhoads"], correctAnswerIndex: 3)
        let question10 = TriviaQuestion(question: "What was Eric Clapton's preferred Drug?", answer: ["Heroin", "Cocaine", "Ectasy", "Methamphetamine"], correctAnswerIndex: 0)
        questions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10]
        
    }
    
    
    func getNewQuestion() {
        if questions.count > 0 {
            
        
        randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
        currentQuestion = questions[randomIndex]
        } else {
            resetGame()
        }
    }
    
    func showRightAlert() {
        let rightAlert = UIAlertController(title: "Decent.", message: "Rock On With TriviaRock", preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.doneDidQuestions.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestion()
        }
        
        rightAlert.addAction(closeAction)
        
      self.present(rightAlert, animated: true, completion: nil)
    }
    
    
    func showWrongAlert() {
        let wrongAlert = UIAlertController(title: "WRONG!", message: "You just dont pay attention do you?", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
        self.doneDidQuestions.append(self.questions.remove(at: self.randomIndex))
        self.getNewQuestion()
        }
        
        
      wrongAlert.addAction(closeAction)
        self.present(wrongAlert, animated: true, completion: nil)
       
    }
    
    func resetGame() {
        score = 0
        if !questions.isEmpty {
            doneDidQuestions.append(contentsOf: questions)
        }
        questions = doneDidQuestions
        doneDidQuestions.removeAll()
        
        getNewQuestion()
    }
    // Show an alert when the game is over
    func showGameOver() {
        let gameOverAlert = UIAlertController(title: "Results Dude.", message: "Game over! \(score) out of \(doneDidQuestions.count)", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Result", style: .default) { _ in
            self.resetGame()
            
        }
        gameOverAlert.addAction(resetAction)
        
        self.present(gameOverAlert, animated: true, completion: nil)
    }
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if sender.tag == currentQuestion.correctAnswerIndex {
            // question right
            showRightAlert()
            score += 10
        } else {
            // question wrong
            showWrongAlert()
            score -= 5
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        resetGame()
    }
    // Unwind segue to this screen
    @IBAction func unwindToQuizScreen(seque: UIStoryboardSegue) {
        
    }
}


