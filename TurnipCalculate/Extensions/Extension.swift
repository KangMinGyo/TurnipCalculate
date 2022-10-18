//
//  Extension.swift
//  TurnipCalculate
//
//  Created by KangMingyo on 2022/09/18.
//

import UIKit

extension UITextField {
    func setting() {
        layer.cornerRadius = 10
        backgroundColor = .systemGray6
        textAlignment = .center
        heightAnchor.constraint(equalToConstant: 30).isActive = true
        widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
