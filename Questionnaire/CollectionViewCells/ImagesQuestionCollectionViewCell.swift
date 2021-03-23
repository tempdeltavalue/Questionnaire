//
//  ImagesCollectionViewCell.swift
//  Questionnaire
//
//  Created by Mykhailo Melnychuk on 23.03.2021.
//

import UIKit

class ImagesQuestionCollectionViewCell: UICollectionViewCell {
    
    
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
        flowLayout.itemSize = CGSize(width: 120, height: 120)

        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.register(ImageOptionCollectionViewCell.self, forCellWithReuseIdentifier: "ImageOptionCollectionViewCell")
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

extension ImagesQuestionCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return question.options?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageOptionCollectionViewCell", for: indexPath) as? ImageOptionCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let url = question.options?[indexPath.row].img_url {
            cell.imageView.downloaded(from: url)

        }
        
        return cell
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
