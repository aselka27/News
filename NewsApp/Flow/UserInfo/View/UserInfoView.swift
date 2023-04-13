//
//  File.swift
//  NewsApp
//
//  Created by саргашкаева on 20.07.2022.
//

import UIKit

class UserInfoView: UIView {
    
    // MARK: - Views
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let websiteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Congigure
    
    private func configureUI() {
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(idLabel)
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(userNameLabel)
        verticalStack.addArrangedSubview(phoneLabel)
        verticalStack.addArrangedSubview(websiteLabel)
        verticalStack.addArrangedSubview(companyLabel)
    }
    
    private func setConstraints() {
        let constraints = [
            verticalStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
