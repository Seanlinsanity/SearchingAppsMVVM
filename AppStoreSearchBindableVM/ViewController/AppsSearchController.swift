//
//  AppsSearchController.swift
//  AppStoreJSONAPI
//
//  Created by Sean on 2020/4/2.
//  Copyright © 2020 Sean. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    fileprivate let cellId = "cellId"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    let loadingIndicator = UIActivityIndicatorView(style: .large)

    let searchViewModel = AppsSearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.backgroundColor = .black
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchBar()
        setupLoadingIndicator()
        setupSearchViewModelObserver()
    }
    
    fileprivate func setupSearchViewModelObserver() {
        searchViewModel.appResults.bind { [weak self] (_) in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        searchViewModel.isSearching.bind { [weak self] (isSearching) in
            guard let isSearching = isSearching else { return }
            DispatchQueue.main.async {
                isSearching ? self?.loadingIndicator.startAnimating() : self?.loadingIndicator.startAnimating()
                self?.loadingIndicator.isHidden = !isSearching
            }
        }
    }
    
    fileprivate func setupLoadingIndicator() {
        loadingIndicator.color = .lightGray
        view.addSubview(loadingIndicator)
        loadingIndicator.centerInSuperview(size: .init(width: 60, height: 60))
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchViewModel.performSearch(searchText)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchViewModel.appResults.value?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.appResult = searchViewModel.appResults.value?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 350)
    }
    
}
