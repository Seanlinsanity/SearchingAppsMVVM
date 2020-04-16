//
//  BaseListController.swift
//  AppStoreJSONAPI
//
//  Created by Sean on 2020/4/3.
//  Copyright © 2020 Sean. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
