//
//  PostsViewController.swift
//  NewsApp
//
//  Created by саргашкаева on 18.07.2022.
//

import UIKit
import SnapKit
import Kingfisher

class PostsViewController: UIViewController {
    
    // MARK: - Property
   
    var viewModel: PostViewModelProtocol
    var imageView = UIImageView()
    var id = "1"
    

    // MARK: - Views
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    } ()
    
    // MARK: - Init
    
    init( viewModel: PostViewModelProtocol=PostViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All post"
        configureUI()
        getPostData()
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
    
    private func getPostData() {
        viewModel.getData { [weak self] in
            DispatchQueue.main.async {
                print( self?.viewModel.articlesModel.articles)
               
                self?.tableView.reloadData()
            }
        }
    }
}


      // MARK: - UITableViewDataSource

extension PostsViewController: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articlesModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let model = self.viewModel.articlesModel.articles[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

        
      // MARK: - UITableViewDelegate

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postId = indexPath.row + 1
        let vc = CommentsViewController(viewModel: CommentsViewModel())
        vc.viewModel.postId = postId
        print(vc.viewModel.postId)
        navigationController?.pushViewController(vc, animated: true)
    }
}


