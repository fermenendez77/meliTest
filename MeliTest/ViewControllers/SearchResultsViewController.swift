//
//  SearchResultsViewController.swift
//  MeliTest
//
//  Created by Fernando Menendez on 06/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    var results : [Results] = []
    var searchedString : String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        requestItems()
    }
    
    private func requestItems() {
        if let keyword = searchedString {
            let requestController = RequestController()
            requestController.searchRequest(keyWord: keyword) { response in
                if let results = response.results {
                    self.results = results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.DETAIL_PRODUCT_SEGUE {
            guard let selectedProduct = sender as? Results,
                let destination = segue.destination as? DetailProductViewController else {
                    return
            }
            destination.itemID = selectedProduct.id
        }
    }
}

extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: Constants.DETAIL_PRODUCT_SEGUE, sender: results[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.STORYBOARD_ID, for: indexPath)
                        as! ResultsTableViewCell
        let result = results[indexPath.row]
        let resultViewModel = ResultsViewModel(product: result)
        resultViewModel.configureCell(cell: cell)
        return cell
    }
    
    
}
