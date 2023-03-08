//
//  Model.swift
//  Settings
//
//  Created by Tilek Koszhanov on 3/8/23.
//

import UIKit

struct Section {
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
