//
//  UserInfoViewController.swift
//  NewsApp
//
//  Created by саргашкаева on 20.07.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    // MARK: - Views
    
    let userInfoView: UserInfoView = {
        let view = UserInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Configure
    
    private func configureUI() {
        title = "User info"
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        view.addSubview(userInfoView)
    }
    
    private func setConstraints() {
        userInfoView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}
