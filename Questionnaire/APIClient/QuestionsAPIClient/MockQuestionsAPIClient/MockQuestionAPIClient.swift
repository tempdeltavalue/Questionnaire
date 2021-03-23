//
//  MockQuestionAPIClient.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 23.03.2021.
//

import Foundation

struct MockQuestionsAPIClient {
    let jsonDecoder = JSONDecoder()

    func getQuestions(completion: ( (QuestionsArray?, Error?)->() )) {
        if let path = Bundle.main.path(forResource: "questions", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let questionsArray = try jsonDecoder.decode(QuestionsArray.self, from: data)
                completion(questionsArray, nil)

            } catch {
                completion(nil, error)
            }
        }
    }
}
