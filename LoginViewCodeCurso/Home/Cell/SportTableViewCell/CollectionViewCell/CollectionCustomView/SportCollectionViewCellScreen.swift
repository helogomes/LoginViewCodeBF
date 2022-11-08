//
//  SportCollectionViewCellScreen.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 08/11/22.
//

import UIKit

class SportCollectionViewCellScreen: UIView {

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var sportName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.addSubview(imageView)
        self.addSubview(sportName)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: self.sportName.topAnchor, constant: -10),
            
            sportName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            sportName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            sportName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            sportName.heightAnchor.constraint(equalToConstant: 20)

        ])
    }
    
}