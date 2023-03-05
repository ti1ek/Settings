//
//  ViewController.swift
//  Settings
//
//  Created by Zhuldyz Bukeshova on 05.03.2023.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption  {
    let title: String
    let icon: UIImage?
    let backgroundColor: UIColor
    let handler:(() -> Void)
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let backgroundColor: UIColor
    let handler:(() -> Void)
}

class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier )
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier )
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        models.append(Section(title: "General" , options: [
            .switchCell(model: SettingsSwitchOption(title: "Airplane Mode" , icon: UIImage(systemName: "airplane"), backgroundColor: .systemOrange, handler: {
                
            },   isOn: true))
        ]))
        
        models.append(Section(title: "General" , options: [
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), backgroundColor: .link) {
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "wave.3.forward"), backgroundColor: .link) {
            }),
            .staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), backgroundColor: .systemOrange) {
            }),
            .staticCell(model: SettingsOption(title: "Mobile Data", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), backgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOption(title: "Personal Hostpot", icon: UIImage(systemName: "personalhotspot"), backgroundColor: .systemGreen) {
            })
        ]))
        
        models.append(Section(title: "General" , options: [
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), backgroundColor: .link) {
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "wave.3.forward"), backgroundColor: .link) {
            }),
            .staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), backgroundColor: .systemOrange) {
            }),
            .staticCell(model: SettingsOption(title: "Mobile Data", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), backgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOption(title: "Personal Hostpot", icon: UIImage(systemName: "personalhotspot"), backgroundColor: .systemGreen) {
            })
        ]))
        
        models.append(Section(title: "General" , options: [
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), backgroundColor: .link) {
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "wave.3.forward"), backgroundColor: .link) {
            }),
            .staticCell(model: SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), backgroundColor: .systemOrange) {
            }),
            .staticCell(model: SettingsOption(title: "Mobile Data", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), backgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingsOption(title: "Personal Hostpot", icon: UIImage(systemName: "personalhotspot"), backgroundColor: .systemGreen) {
            })
        ]))
    }
}

extension SettingsViewController: UITableViewDelegate {
    
}

extension SettingsViewController: UITableViewDataSource {
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
        let type  = models[indexPath.section].options[indexPath.row]
        
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}
