//
//  QuestionsHeaderView.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 01.04.2021.
//

import UIKit

final class QuestionHeaderView: UIView {
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var backgroundImageView: UIImageView = {
        var bImageView = UIImageView(frame: .zero)
        bImageView.translatesAutoresizingMaskIntoConstraints = false

        return bImageView
    }()
    
    var text: String? {
        didSet {
            questionLabel.text = text
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(questionLabel)
        addSubview(backgroundImageView)
        
        questionLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true


    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    
    
}
