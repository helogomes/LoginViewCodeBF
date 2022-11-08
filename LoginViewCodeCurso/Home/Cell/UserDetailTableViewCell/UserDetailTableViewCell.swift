//
//  UserDetailTableViewCell.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 08/11/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userDetailView: UserDetailTableViewCellScreen = {
        let view = UserDetailTableViewCellScreen()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        configConstraintsDescriptionCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        contentView.addSubview(userDetailView)
    }
    
    public func setUpCell(data: UserData) {
        self.userDetailView.nameLabel.text = data.name
        self.userDetailView.userImageView.image = UIImage(named: data.imageName)
    }
    
    //edges -> mesma coisa que estar setando o top, leading, trailling e bottom, são as 4 posições, e todas olhando para a superView
    private func configConstraintsDescriptionCell() {
        userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
