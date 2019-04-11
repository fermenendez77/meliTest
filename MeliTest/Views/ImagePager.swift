//
//  ImagePager.swift
//  MeliTest
//
//  Created by Fernando Menendez on 09/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import Foundation
import UIKit

class ImagePager : UIScrollView {
    
    var stackView = UIStackView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    func configureView() {
        //self.isPagingEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        stackView.frame = self.bounds
        stackView.axis = .horizontal
        self.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
        print(isScrollEnabled)
        self.addSubview(stackView)
        stackView.addArrangedSubview(UIImageView(image: UIImage(named: "image-placeholder")))
        stackView.addArrangedSubview(UIImageView(image: UIImage(named: "image-placeholder")))
        stackView.addArrangedSubview(UIImageView(image: UIImage(named: "image-placeholder")))
        stackView.addArrangedSubview(UIImageView(image: UIImage(named: "image-placeholder")))
    }
}
