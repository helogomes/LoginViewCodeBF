//
//  UserDetailView.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 08/11/22.
//

import UIKit

class UserDetailTableViewCellScreen: UIView {
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        
        //constraints - forma nativa
        setUpConstraints()
        
        //constraints - SnapKit
        configUserImageViewConstraints()
        configNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        addSubview(userImageView)
        addSubview(nameLabel)
    }
    
    //MARK: - Constraints de forma nativa
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            userImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 80),
            userImageView.widthAnchor.constraint(equalToConstant: 80),

            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 20),
            
        ])
    }
    
    //MARK: - Constraints com SnapKit
    func configUserImageViewConstraints() {
//        userImageView.snp.makeConstraints { make in
//            make.centerY.leading.equalToSuperview()
//            make.height.width.equalTo(80)
//        }
    }
    
    func configNameLabelConstraints() {
//        nameLabel.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalTo(userImageView.snp.trailing).offset(20)
//        }
    }



}
