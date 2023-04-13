//
//  CommentsViewController.swift
//  NewsApp
//
//  Created by саргашкаева on 20.07.2022.
//

import UIKit

class CommentsViewController: UIViewController {
    
    // MARK: - Property
    
    var viewModel: CommentsViewModelProtocol
    var postId: Int = 0
    
    // MARK: - Views
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    } ()
    
    
    // MARK: - Init
    
    init( viewModel: CommentsViewModelProtocol = CommentsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getCommentsData()
    }
    
    
    // MARK: - Congigure
    
    private func configureUI() {
        title = "All comments"
        setViews()
        tableView.dataSource = self
        setConstraints()
    }
    
    private func setViews() {
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    private func getCommentsData() {
        viewModel.getData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

       // MARK: - UITableViewDataSource

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commentModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let comment = viewModel.commentModel[indexPath.row]
        cell.textLabel?.text = comment?.name
        return cell
    }
}

