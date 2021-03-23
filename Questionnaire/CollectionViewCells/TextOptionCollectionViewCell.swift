//
//  ImageOptionsCell.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 23.03.2021.
//

import UIKit

final class TextOptionCollectionViewCell: UICollectionViewCell {
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(questionLabel)
        questionLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        questionLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        questionLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
