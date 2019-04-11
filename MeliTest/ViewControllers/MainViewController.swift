//
//  ViewController.swift
//  MeliTest
//
//  Created by Fernando Menendez on 06/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var mainProducts : [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        requestMainProducts()
    }
    
    func requestMainProducts() {
        let requestController = RequestController()
        requestController.searchCategories { mainProducts in
            if let products = mainProducts.results {
                self.mainProducts = products
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func configureSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Buscar en Mercado Libre"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SEARCH_RESULTS_SEGUE,
            let searchString = sender as? String {
                let searchResultsViewController = segue.destination as! SearchResultsViewController
                searchResultsViewController.searchedString = searchString
        }
        if segue.identifier == Constants.MAIN_PRODUCTS_SEGUE,
            let itemID = sender as? String {
                let detailProductViewController = segue.destination as! DetailProductViewController
                detailProductViewController.itemID = itemID
        }
    }
}

extension MainViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: Constants.SEARCH_RESULTS_SEGUE, sender: searchBar.text)
    }
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = mainProducts[indexPath.row]
        performSegue(withIdentifier: Constants.MAIN_PRODUCTS_SEGUE, sender: product.id)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 15
        let collectionCellSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionCellSize/2, height: collectionCellSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! MainProductsCollectionViewCell
        let mainProductsModelView = MainProductsViewModel(withProduct: mainProducts[indexPath.row])
        mainProductsModelView.configureModel(withView: cell)
        return cell
    }
    
    
}
