//
//  addQuestionViewController.swift
//  Trivia Game
//
//  Created by Sawyer Cherry on 10/11/18.
//  Copyright © 2018 Sawyer Cherry. All rights reserved.
//

import UIKit

class addQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionAddBox: UITextField!
    @IBOutlet weak var answer1Box: UITextField!
    @IBOutlet weak var answer2Box: UITextField!
    @IBOutlet weak var answer3Box: UITextField!
    @IBOutlet weak var answer4Box: UITextField!
    @IBOutlet weak var correctAnswerSegmentedControl: UISegmentedControl!
    
    var newQuestion: TriviaQuestion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    
    
     
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            destination.questions.append(newQuestion)
        }
     
     }
    
    func showError() {
        let errorAlert = UIAlertController(title: "Error", message: "Check Your Work, Complete All Text Fields.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let question = questionAddBox.text, !question.isEmpty,
            let answer1 = answer1Box.text, !answer1.isEmpty,
            let answer2 = answer2Box.text, !answer2.isEmpty,
            let answer3 = answer3Box.text, !answer3.isEmpty,
            let answer4 = answer4Box.text, !answer4.isEmpty else {
            showError()
                return
        }
        //unwindToQuiz Screen
        newQuestion = TriviaQuestion(question: question, answer: [answer1, answer2, answer3, answer4], correctAnswerIndex: correctAnswerSegmentedControl.selectedSegmentIndex)
        self.performSegue(withIdentifier: "unwindToQuiz Screen", sender: self)
    }
// errors can frig off
}

