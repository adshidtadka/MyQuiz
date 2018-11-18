//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by Mao Nishi on 2016/10/10.
//  Copyright © 2016年 Mao Nishi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var correctPercentLabel: UILabel! //正解率ラベル
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 問題数を取得する
        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        
        // 正解数を取得する
        var correctCount: Int = 0
        // 正解数を計算する
        for questionData in QuestionDataManager.sharedInstance.questionDataArray {
            if questionData.isCorrect() {
                // 正解数を増やす
                correctCount += 1
            }
        }
        
        // 正解率を計算する
        let correctPercent: Float = (Float(correctCount) / Float(questionCount)) * 100
        
        // 正解率を小数第一位まで計算して画面に反映する
        correctPercentLabel.text = String(format: "%.1f", correctPercent) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
