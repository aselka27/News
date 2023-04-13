//
//  UsersViewController.swift
//  NewsApp
//
//  Created by саргашкаева on 18.07.2022.
//

import UIKit
import SnapKit

class UsersViewController: UIViewController {
    
    
    // MARK: - Property
    
    var viewModel: UserViewModelProtocol
    
    
    // MARK: - Views
    
   let tableView: UITableView = {
        let table = UITableView()
        table.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    } ()
    
    
    // MARK: - Init
    
    init(viewModel: UserViewModelProtocol = UserViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All user"
        configureUI()
        getUserData()
    }
    
    
    // MARK: - Congigure
    
    private func configureUI() {
        setViews()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setConstraints()
        view.backgroundColor = .white
    }
    
    private func setViews() {
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    private func getUserData() {
        viewModel.getData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

       // MARK: - UITableView DataSource

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        let users = viewModel.userModel[indexPath.row]
        cell.configure(name: users?.name ?? "", userName: users?.username ?? "")
        return cell
    }
}

        // MARK: - UITableView Delegate

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UserInfoViewController()
        let users = viewModel.userModel[indexPath.row]
        
        vc.userInfoView.nameLabel.text = "name = \(users?.name ?? "")"
        vc.userInfoView.idLabel.text = "id = \(users?.id ?? 0)"
        vc.userInfoView.userNameLabel.text = "username = \(users?.username ?? "")"
        vc.userInfoView.phoneLabel.text = "phone = \(users?.phone ?? "")"
        vc.userInfoView.websiteLabel.text = "website = \(users?.website ?? "")"
        vc.userInfoView.companyLabel.text = "company = \(users?.company.name ?? "")"
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

