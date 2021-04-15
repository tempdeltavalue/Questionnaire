//
//  QuestionableView.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 01.04.2021.
//

import UIKit

class QuestionCollectionViewCell<T: UICollectionViewCell & Reusable>: UICollectionViewCell, Reusable {
    var data: String? {
        didSet {
            headerView.questionLabel.text = data
        }
    }
    
    static var reuseId: String {
        return "QuestionCollectionViewCell" + T.reuseId
    }
    
    var headerView: QuestionHeaderView!
    var optionsView: QuestionOptionsView<T>!

    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = .green

        headerView = QuestionHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false

        optionsView = QuestionOptionsView()
        optionsView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(headerView)
        addSubview(optionsView)
        
        headerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        let questionSectionHeight: CGFloat = 100
        headerView.heightAnchor.constraint(lessThanOrEqualToConstant: questionSectionHeight).isActive = true
        
        
        optionsView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        optionsView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        optionsView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        optionsView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
