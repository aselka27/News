//
//  PostTableViewCell.swift
//  NewsApp
//
//  Created by саргашкаева on 19.07.2022.
//

import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "PostCell"

    
    // MARK: - Views
    private var titleTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private var bodyTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   var mainImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Init
    override func prepareForReuse() {
        super.prepareForReuse()
        titleTextLabel.text = nil
        bodyTextLabel.text = nil
        mainImageView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Congigure
    private func configureUI() {
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        contentView.addSubview(bodyTextLabel)
        contentView.addSubview(titleTextLabel)
        contentView.addSubview(mainImageView)
    }
    
    private func setConstraints() {
       
        titleTextLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).inset(5)
        }
        bodyTextLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextLabel.snp.bottom).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).inset(20)
        }
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(bodyTextLabel.snp.bottom).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(10)
        }
    }
  
    
    // MARK: - Helpers
    public func configure(with model: Post) {
        titleTextLabel.text = model.title ?? "Not available"
        bodyTextLabel.text = model.description ?? "Not available"
        guard let urlImage = model.urlToImage else {
            mainImageView.contentMode = .scaleAspectFill
            mainImageView.image = UIImage(named: "noImage")
            return }
        let url = URL(string: urlImage)
        DispatchQueue.main.async { [weak self] in
            self?.mainImageView.kf.setImage(with: url)
        }
    }

}

