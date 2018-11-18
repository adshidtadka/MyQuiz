//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by Sawa Takaaki on 2018/11/18.
//  Copyright © 2018 Sawa Takaaki. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var correctPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        var correctCount :Int = 0
        for questionData in QuestionDataManager.sharedInstance.questionDataArray {
            if questionData.isCollect() {
                correctCount += 1
            }
        }
        
        let correctPercent: Float = (Float(correctCount) / Float(questionCount)) * 100
        
        correctPercentLabel.text = String(format: "%.1f", correctPercent) + "%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
