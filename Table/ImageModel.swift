//
//  ImageModel.swift
//  Table
//
//  Created by Сергей Яковлев on 24.01.2022.
//

import Foundation
import UIKit

class ImageModel {
    
    let text: String
    let image: UIImage
    let subtext: String
    
    init(text: String, imageName: String, subtext: String) {
        self.text = text
        self.image = UIImage(named: imageName)!
        self.subtext = subtext
    }
}
