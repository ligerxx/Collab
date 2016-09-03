//
//  UITableViewCellExtension.swift
//  Collab
//
//  Created by Casey Feldman on 9/3/16.
//  Copyright © 2016 Exception Mark Inc. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func prepareDisclosureIndicator() {
        for case let button as UIButton in subviews {
            let image = button.backgroundImage(for: .normal)?.withRenderingMode(.alwaysTemplate)
            button.setBackgroundImage(image, for: .normal)
        }
    }
}
