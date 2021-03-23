//
//  QuestionsArray.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 23.03.2021.
//

import Foundation

struct Question: Codable {
    var id: String
    var text: String?
    var options: [Option]?
}
