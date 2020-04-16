//
//  AppsSearchViewModel.swift
//  AppStoreSearchBindableVM
//
//  Created by Sean on 2020/4/12.
//  Copyright © 2020 Sean. All rights reserved.
//

import Foundation

class AppsSearchViewModel {
    var appResults = Bindable<[Result]>()
    var isSearching = Bindable<Bool>()
    var timer: Timer?
    
    func performSearch(_ searchText: String) {
        timer?.invalidate()
        isSearching.value = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            // this will actually fire my search
            Service.shared.fetchApps(searchText: searchText) { [weak self] (res, err) in
                self?.appResults.value = res?.results ?? []
                self?.isSearching.value = false
            }
        })
    }
}
