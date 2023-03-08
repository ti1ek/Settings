//
//  ViewController.swift
//  Settings
//
//  Created by Tilek Koszhanov on 05.03.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Outlets
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    // MARK: - Model Data
    
    var models: [Section] = [
        Section(options: [
            .switchCell(model: SettingsSwitchOption(title: "Airplane Mode" , icon: UIImage(systemName: "airplane"), backgroundColor: .systemOrange, handler: {
            },   isOn: true)),
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), backgroundColor: .link) {
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(named: "bluetooth"), backgroundColor: .link) {
            }),
            .staticCell(model: SettingsOption(title: "Mobile Data", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), backgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOption(title: "Personal Hostpot", icon: UIImage(systemName: "personalhotspot"), backgroundColor: .systemGreen) {
            })
        ]),
        
        Section(options: [
            .staticCell(model: SettingsOption(title: "Notifications", icon: UIImage(systemName: "bell.badge"), backgroundColor: .systemRed) {
            }),
            .staticCell(model: SettingsOption(title: "Sounds & Haptics", icon: UIImage(systemName: "speaker.wave.3.fill"), backgroundColor: .systemRed) {
            }),
            .staticCell(model: SettingsOption(title: "Focus", icon: UIImage(systemName: "moon.fill"), backgroundColor: .systemIndigo) {
            }),
            .staticCell(model: SettingsOption(title: "Screen Time", icon: UIImage(systemName: "hourglass"), backgroundColor: .systemIndigo) {
            })
        ]),
        
        Section(options: [
            .staticCell(model: SettingsOption(title: "General", icon: UIImage(systemName: "gear"), backgroundColor: .systemGray) {
            }),
            .staticCell(model: SettingsOption(title: "Control Centre", icon: UIImage(systemName: "switch.2"), backgroundColor: .systemGray) {
            }),
            .staticCell(model: SettingsOption(title: "Display & Brightness", icon: UIImage(systemName: "textformat.size"), backgroundColor: .systemBlue) {
            }),
            .staticCell(model: SettingsOption(title: "Accessibility", icon: UIImage(systemName: "figure.arms.open"), backgroundColor: .link) {
            }),
            .staticCell(model: SettingsOption(title: "Face ID & Passcode", icon: UIImage(systemName: "faceid"), backgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOption(title: "Emergency SOS", icon: UIImage(systemName: "sos"), backgroundColor: .systemRed) {
            }),
            .staticCell(model: SettingsOption(title: "Exposure Notifications", icon: UIImage(systemName: "microbe.fill"), backgroundColor: .systemRed) {
            }),
            .staticCell(model: SettingsOption(title: "Battery", icon: UIImage(systemName: "battery.100"), backgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOption(title: "Privacy & Security", icon: UIImage(systemName: "hand.raised.fill"), backgroundColor: .link) {
            })
        ])]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
    
        setupHierarchy()
        setupLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.frame = view.bounds
    }
}

// MARK: - Extension

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model )
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath) as? SwitchTableViewCell  else {
                return UITableViewCell()
            }
            cell.configure(with: model )
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let type = models[indexPath.section].options[indexPath.row]
          
        switch type.self {
        case .staticCell(let model):
            let viewController = DetailViewController()
            viewController.fillView(with: model)
            navigationController?.pushViewController(viewController, animated: true)
        case .switchCell:
            print("some future action")
        }
    }
}
