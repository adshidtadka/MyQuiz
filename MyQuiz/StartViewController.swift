//
//  StartViewController.swift
//  MyQuiz
//
//  Created by Sawa Takaaki on 2018/11/18.
//  Copyright © 2018 Sawa Takaaki. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        QuestionDataManager.sharedInstance.loadQuestion()
        
        guard let nextViewController = segue.destination as? QuestionViewController  else {
            return
        }
        
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else {
            return
        }
        
        nextViewController.questionData = questionData
    }
    
    @IBAction func goToTitle(_ segue: UIStoryboardSegue) {
        
    }
}
