//
//  SportTableViewCell.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 08/11/22.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    var sportTableViewCellScreen: SportTableViewCellScreen = SportTableViewCellScreen()
    var data: [Sport] = []
    static let identifier: String = "SportTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraints()
        sportTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        sportTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sportTableViewCellScreen)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            sportTableViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            sportTableViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            sportTableViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            sportTableViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
        ])
    }
     
    public func dataCollection(data: [Sport]) {
        self.data = data
    }

}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }
    
    
}
