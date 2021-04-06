//
//  QuestionOptionsView.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 01.04.2021.
//

import UIKit

protocol Reusable: class {
    var data: String? { get set }
    
    static var reuseId: String { get }

}

// Conformance of generic class 'QuestionOptionsView<T>' to @objc protocol
// 'UICollectionViewDataSource' cannot be in an extension

class QuestionOptionsView<T: UICollectionViewCell & Reusable>: UIView, UICollectionViewDataSource {
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.register(T.self, forCellWithReuseIdentifier: T.reuseId)
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    var options: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        print("REUSE ID", T.reuseId)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as? T else {
            return UICollectionViewCell()
        }
        
        cell.data = options?[indexPath.row]
        
        return cell
    }
    
}
