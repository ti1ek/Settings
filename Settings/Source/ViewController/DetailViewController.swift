//
//  DetailViewController.swift
//  Settings
//
//  Created by Tilek Koszhanov on 3/8/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    var settingsData: SettingsOption?
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .link
        label.font = .preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    func setupHierarchy() {
        view.addSubview(iconImageView)
        view.addSubview(nameLabel)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 150),
            iconImageView.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -200),
            nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 200)
        ])
    }
    
    // MARK: - Functions
    
    func fillView(with model: SettingsOption) {
        iconImageView.image = model.icon
        nameLabel.text = model.title
    }
}
