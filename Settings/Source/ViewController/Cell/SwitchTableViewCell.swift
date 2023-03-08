//
//  SwitchTableViewCell.swift
//  Settings
//
//  Created by Tilek Koszhanov on 05.03.2023.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    static let identifier = "SwitchTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .systemBlue
        return switchButton
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()

        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been im plemented")
    }
    
    // MARK: - Setup
    
    func setupHierarchy() {
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(switchButton )
        contentView.addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height - 12
        
        iconContainer.frame = CGRect(
            x: 15,
            y: 6,
            width: size,
            height: size)
        
        let imageSize: CGFloat = size / 1.5
        
        iconImageView.frame = CGRect(
            x: (size - imageSize) / 2,
            y: (size - imageSize) / 2,
            width: imageSize,
            height: imageSize)
        
        switchButton.sizeToFit()
        switchButton.frame = CGRect(
            x: contentView.frame.size.width - switchButton.frame.size.width - 10,
            y: (contentView.frame.size.height - switchButton.frame.size.height) / 2,
            width: switchButton.frame.size.width,
            height: switchButton.frame.size.height)
        
        label.frame = CGRect(
            x: 25   + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20  - iconContainer.frame.size.width,
            height: contentView.frame.size.height)
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconContainer.backgroundColor = nil
        iconImageView.image = nil
        label.text = nil
        switchButton.isOn = false
    }
    
    public func configure(with model: SettingsSwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.backgroundColor
        switchButton.isOn = model.isOn
    }
}
