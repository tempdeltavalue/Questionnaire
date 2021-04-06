//
//  ImageOptionsCell.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 23.03.2021.
//

import UIKit

final class TextOptionCollectionViewCell: UICollectionViewCell, Reusable {
    
    var data: String? {
        didSet {
            optionLabel.text = data
        }
    }
    
    static var reuseId: String {
        return "TextOptionCollectionViewCell"
    }
    
    
    lazy var  optionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(optionLabel)
        optionLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        optionLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        optionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        optionLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
