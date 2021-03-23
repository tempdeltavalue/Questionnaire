//
//  ViewController.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 23.03.2021.
//

import UIKit

class ViewController: UIViewController {
    var questionArray = QuestionsArray()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        // Temporary
//        flowLayout.itemSize = CGSize(width: 300, height: 300)
        flowLayout.estimatedItemSize = CGSize(width: 300, height: 300)
        flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize

        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        collectionView.register(ImagesQuestionCollectionViewCell.self, forCellWithReuseIdentifier: "ImagesCollectionViewCell")
        collectionView.register(TextQuestionCollectionViewCell.self, forCellWithReuseIdentifier: "TextQuestionCollectionViewCell")
        
        
        collectionView.dataSource = self
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.collectionView.reloadData()

        let apiClient = MockQuestionsAPIClient()
        apiClient.getQuestions() { questionsArr, error in
            self.questionArray = questionsArr!
            self.collectionView.reloadData()
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionArray.questions?.count ?? 0 //test value for images request
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextQuestionCollectionViewCell", for: indexPath) as? TextQuestionCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.question = questionArray.questions?[indexPath.row]
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as? ImagesQuestionCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.question = questionArray.questions?[indexPath.row]
            
            return cell

        }
    }
}
