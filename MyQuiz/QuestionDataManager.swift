//
//  QuestionDataManager.swift
//  MyQuiz
//
//  Created by Sawa Takaaki on 2018/11/18.
//  Copyright © 2018 Sawa Takaaki. All rights reserved.
//

import Foundation

class QuestionData {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var collectAnswerNumber: Int
    var userChoiceAnswerNumer: Int?
    var questionNo: Int = 0
    
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        answer1 = questionSourceDataArray[1]
        answer2 = questionSourceDataArray[2]
        answer3 = questionSourceDataArray[3]
        answer4 = questionSourceDataArray[4]
        collectAnswerNumber = Int(questionSourceDataArray[5])!
    }
    
    func isCollect() -> Bool {
        if collectAnswerNumber == userChoiceAnswerNumer {
            return true
        }
        return false
    }
}

class QuestionDataManager {
    
    static let sharedInstance = QuestionDataManager()
    var questionDataArray = [QuestionData]()
    var nowQuestionIndex: Int = 0
    
    private init() {
        
    }
    
    func loadQuestion() {
        questionDataArray.removeAll()
        nowQuestionIndex = 0
        guard let csvFilePath = Bundle.main.path(forResource: "question", ofType: "csv") else {
            print("csvファイルが存在しません")
            return
        }
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: String.Encoding.utf8)
            csvStringData.enumerateLines(invoking: {(line, stop) in
                let questionSourceDataArray = line.components(separatedBy: ",")
                let questionData = QuestionData(questionSourceDataArray: questionSourceDataArray)
                self.questionDataArray.append(questionData)
                questionData.questionNo = self.questionDataArray.count
            })
        } catch let error {
            print("csvファイルの読み込みエラーが発生しました:\(error)")
            return
        }
    }
    
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil
    }
}
    
    

}
