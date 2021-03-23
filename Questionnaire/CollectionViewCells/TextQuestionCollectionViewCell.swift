//
//  TextCollectionViewCell.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 23.03.2021.
//

import UIKit

class TextQuestionCollectionViewCell: UICollectionViewCell {
    
    
    var question: Question! {
        didSet {
            questionLabel.text = question.text
            collectionView.reloadData()
        }
    }
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        // Temporary
        flowLayout.itemSize = CGSize(width: 300, height: 40)

        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.register(TextOptionCollectionViewCell.self, forCellWithReuseIdentifier: "TextOptionCollectionViewCell")
        collectionView.dataSource = self
        

        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(collectionView)
        addSubview(questionLabel)

        
        questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        questionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        collectionView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
//        collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true


    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TextQuestionCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return question.options?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextOptionCollectionViewCell", for: indexPath) as? TextOptionCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.questionLabel.text = question.options?[indexPath.row].text
        return cell
    }
}
