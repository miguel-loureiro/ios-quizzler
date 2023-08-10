//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    
    @IBOutlet weak var choice2: UIButton!
    
    @IBOutlet weak var choice3: UIButton!
    
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    //New button needs to be linked to this IBAction too.
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizLogic.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizLogic.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizLogic.getQuestionText()
        
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizLogic.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizLogic.getProgress()
        scoreLabel.text = "Score: \(quizLogic.getScore())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        
        //Third button needs to be reset too.
        choice3.backgroundColor = UIColor.clear
        
    }
    
}
