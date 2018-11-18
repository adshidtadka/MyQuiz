//
//  StartViewController.swift
//  MyQuiz
//
//  Created by Mao Nishi on 2016/10/10.
//  Copyright © 2016年 Mao Nishi. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // 次の画面に遷移する前に呼び出される準備処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 問題文の読込
        QuestionDataManager.sharedInstance.loadQuestion()
        
        // 遷移先画面の呼出
        guard let nextViewController = segue.destination as? QuestionViewController else {
            // 取得できずに終了
            return
        }
        
        //問題文の取り出し
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else {
            // 取得できずに終了
            return
        }
        
        // 問題文のセット
        nextViewController.questionData = questionData
    }

    // タイトルに戻ってくる時に呼び出される処理
    @IBAction func goToTitle(_ segue: UIStoryboardSegue) {
        
    }
}
