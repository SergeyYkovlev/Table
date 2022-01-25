//
//  CollectionViewController.swift
//  Table
//
//  Created by Сергей Яковлев on 24.01.2022.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageService: ImageService = ImageService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ColectionViewCell", bundle: nil), forCellWithReuseIdentifier: "galery")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageService.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let galery = collectionView.dequeueReusableCell(withReuseIdentifier: "galery", for: indexPath) as! CollectionViewCell
        galery.galeryImage.image = imageService.images[indexPath.row].image
        
        return galery
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondViewController = ShowCollectionViewController(imageModel: imageService.images[indexPath.row])
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width / 5, height: view.frame.width / 5)
    }
    
}









