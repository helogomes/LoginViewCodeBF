//
//  HomeVC.swift
//  LoginViewCodeCurso
//
//  Created by user218997 on 07/11/22.
//

import UIKit

class HomeVC: UIViewController {

    var homeScreen: HomeScreen?
    var userData: [UserData] = [UserData(name: "Heloisa", imageName: "menina"),
                                UserData(name: "David", imageName: "menino"),
                                UserData(name: "Marcela", imageName: "menina"),
                               ]
    
    var sportData: [Sport] = [Sport(name: "Corrida", imageName: "corrida"),
                              Sport(name: "Ciclismo", imageName: "ciclismo"),
                              Sport(name: "Yoga", imageName: "yoga"),
                              Sport(name: "Natação", imageName: "natacao"),
                              ]
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: sportData)
            return cell ?? UITableViewCell()
        }
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(data: self.userData[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
