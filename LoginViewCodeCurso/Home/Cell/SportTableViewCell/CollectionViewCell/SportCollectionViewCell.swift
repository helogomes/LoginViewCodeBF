//
//  SportCollectionViewCell.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 08/11/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SportCollectionViewCell"
    
    let sportCollectionViewCellScreen: SportCollectionViewCellScreen = SportCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    public func setUpCell(data: Sport) {
        sportCollectionViewCellScreen.imageView.image = UIImage(named: data.imageName)
        sportCollectionViewCellScreen.sportName.text = data.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        sportCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        sportCollectionViewCellScreen.layer.borderWidth = 1.0
        sportCollectionViewCellScreen.layer.borderColor = UIColor.opaqueSeparator.cgColor
        contentView.addSubview(sportCollectionViewCellScreen)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            sportCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            sportCollectionViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            sportCollectionViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            sportCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
}
