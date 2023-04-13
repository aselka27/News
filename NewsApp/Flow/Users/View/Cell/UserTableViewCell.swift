//
//  UserTableViewCell.swift
//  NewsApp
//
//  Created by саргашкаева on 19.07.2022.
//

import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserCell"
    
    // MARK: - Views
    private let name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Lifecycle VC
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
        contentView.addSubview(name)
        contentView.addSubview(userName)
    }
    
    private func setConstraints() {
        name.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(23)
        }
        userName.snp.makeConstraints { make in
            make.top.equalTo(name).offset(20)
            make.left.equalTo(contentView).offset(23)
        }
    }
    
    // MARK: - Helpers
    public func configure(name: String, userName: String) {
        self.name.text = name
        self.userName.text = userName
    }
    override func prepareForReuse() {
        name.text = nil
        userName.text = nil
    }
}
