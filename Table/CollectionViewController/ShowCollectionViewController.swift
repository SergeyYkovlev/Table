//
//  ShowCollectionViewController.swift
//  Table
//
//  Created by Сергей Яковлев on 25.01.2022.
//

import Foundation
import UIKit

class ShowCollectionViewController: UIViewController {
    
    @IBOutlet weak var showImage: UIImageView!

    var imageModel: ImageModel
    init(imageModel: ImageModel) {
        self.imageModel = imageModel
        super.init(nibName: "ShowCollectionViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage.image = imageModel.image
    }
}
