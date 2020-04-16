//
//  VerticalStackView.swift
//  AppStoreJSONAPI
//
//  Created by Sean on 2020/4/2.
//  Copyright © 2020 Sean. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .vertical        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
