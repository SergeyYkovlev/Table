//
//  ShowInfoViewController.swift
//  Table
//
//  Created by Сергей Яковлев on 25.01.2022.
//

import Foundation
import UIKit

class ShowInfoViewController: UIViewController {
    
    var imageModel: ImageModel
    
    init(imageModel: ImageModel) {
        self.imageModel = imageModel
        super.init(nibName: "ShowInfoViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoImage.image = imageModel.image
        header.text = imageModel.text
        text.text = imageModel.subtext
    }
    
    // MARK: - Subviews
    
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var text: UILabel!
    
}
