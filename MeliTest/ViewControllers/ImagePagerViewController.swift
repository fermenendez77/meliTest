//
//  ImagePagerViewController.swift
//  MeliTest
//
//  Created by Fernando Menendez on 09/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import UIKit

class ImagePagerViewController: UIViewController {
    
    var downloadQueue = OperationQueue()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControlls: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
    
    func loadPictures(pictures : [Pictures]) {
        var count = 0
        pageControlls.numberOfPages = pictures.count
        for picture in pictures {
            guard let stringURL = picture.url, let url = URL(string: stringURL) else {
                return
            }
            let imageDownloader = ImageDownloader(withURL : url)
            imageDownloader.completionBlock = {
                DispatchQueue.main.async {
                    if let image = imageDownloader.image {
                       self.loadImage(image: image, position: count)
                       count=count+1
                    }
                }
            }
            self.downloadQueue.addOperation(imageDownloader)
        }
    }
    
    func loadImage(image : UIImage, position : Int) {
        let imageView = UIImageView()
        let x = self.view.frame.size.width * CGFloat(position)
        imageView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        scrollView.contentSize.width = scrollView.frame.size.width * CGFloat(position + 1)
        scrollView.addSubview(imageView)
    }
}

extension ImagePagerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        pageControlls.currentPage = Int(scrollView.contentOffset.x / pageWidth)
    }
}
