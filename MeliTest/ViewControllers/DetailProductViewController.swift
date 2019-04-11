//
//  DetailProductViewController.swift
//  MeliTest
//
//  Created by Fernando Menendez on 08/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    @IBOutlet weak var soldQuantityLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var warrantyLabel: UILabel!
    @IBOutlet weak var containerImagePager: UIView!
    @IBOutlet weak var descritpionText: UITextView!
    
    var itemID : String?
    
    var imagePagesController : ImagePagerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestProductDetail()
    }
    
    func requestProductDetail() {
        let requestController = RequestController()
        if let id = itemID {
            requestController.searchItem(withID: id) { responseData in
                DispatchQueue.main.async {
                    let detailProductViewModel = DetailProductViewModel(withProduct: responseData)
                    detailProductViewModel.configure(view: self)
                    detailProductViewModel.loadPictures(toView: self.imagePagesController)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.IMAGE_PAGER_SEGUE {
            self.imagePagesController = segue.destination as? ImagePagerViewController
        }
    }
}
