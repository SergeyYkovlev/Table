//
//  ViewController.swift
//  Table
//
//  Created by Сергей Яковлев on 21.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var TextField: UITextField!
    
    var nextImage = 0
    var fonImage : [UIImage] = [
        UIImage(named: "png.png")!,
        UIImage(named: "splash.png")!,
        UIImage(named: "big.png")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonColor(_ sender: Any) {
        nextImage += 1
        image.image = fonImage[nextImage%3]
        
    }
    
    @IBAction func buttonTransfer(_ sender: Any) {
        result.text = TextField.text
        self.view.endEditing(true)
    }
}

