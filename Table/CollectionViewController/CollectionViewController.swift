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
    
    let images: [ImageModel] = [ImageModel(text: "Misha", imageName: "png", subtext: "89994572085"),
                                ImageModel(text: "Masha", imageName: "big", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "splash", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "kkk", subtext: "89606532561"),
                                ImageModel(text: "Petr", imageName: "fff", subtext: "89609834561"),
                                ImageModel(text: "Vitya", imageName: "tyu", subtext: "89675643561"),
                                ImageModel(text: "Ivan", imageName: "rrr", subtext: "89457621783"),
                                ImageModel(text: "Sergey", imageName: "eee", subtext: "89999567843"),
                                ImageModel(text: "Vasya", imageName: "wer", subtext: "89605674326"),
                                ImageModel(text: "Masha", imageName: "big", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "sss", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "kkk", subtext: "89606532561"),
                                ImageModel(text: "Petr", imageName: "fff", subtext: "89609834561"),
                                ImageModel(text: "Vitya", imageName: "ttt", subtext: "89675643561"),
                                ImageModel(text: "Ivan", imageName: "rrr", subtext: "89457621783"),
                                ImageModel(text: "Sergey", imageName: "eee", subtext: "89999567843"),
                                ImageModel(text: "Vasya", imageName: "sss", subtext: "89605674326"),
                                ImageModel(text: "Masha", imageName: "big", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "splash", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "sss", subtext: "89606532561"),
                                ImageModel(text: "Petr", imageName: "fff", subtext: "89609834561"),
                                ImageModel(text: "Vitya", imageName: "tyu", subtext: "89675643561"),
                                ImageModel(text: "Ivan", imageName: "rrr", subtext: "89457621783"),
                                ImageModel(text: "Sergey", imageName: "hgt", subtext: "89999567843"),
                                ImageModel(text: "Vasya", imageName: "wer", subtext: "89605674326"),
                                ImageModel(text: "Masha", imageName: "big", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "ber", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "kkk", subtext: "89606532561"),
                                ImageModel(text: "Petr", imageName: "tyu", subtext: "89609834561"),
                                ImageModel(text: "Vitya", imageName: "wer", subtext: "89675643561"),
                                ImageModel(text: "Ivan", imageName: "bgt", subtext: "89457621783"),
                                ImageModel(text: "Sergey", imageName: "ber", subtext: "89999567843"),
                                ImageModel(text: "Vasya", imageName: "wer", subtext: "89605674326"),
                                ImageModel(text: "Masha", imageName: "big", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "ddd", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "kkk", subtext: "89606532561"),
                                ImageModel(text: "Masha", imageName: "tyu", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "ber", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "kkk", subtext: "89606532561"),
                                ImageModel(text: "Petr", imageName: "fff", subtext: "89609834561"),
                                ImageModel(text: "Vitya", imageName: "wer", subtext: "89675643561"),
                                ImageModel(text: "Ivan", imageName: "bgt", subtext: "89457621783"),
                                ImageModel(text: "Sergey", imageName: "ber", subtext: "89999567843"),
                                ImageModel(text: "Vasya", imageName: "sss", subtext: "89605674326"),
                                ImageModel(text: "Masha", imageName: "big", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "ddd", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "sss", subtext: "89606532561"),
                                ImageModel(text: "Masha", imageName: "big", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "fds", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "ttt", subtext: "89606532561"),
                                ImageModel(text: "Petr", imageName: "fff", subtext: "89609834561"),
                                ImageModel(text: "Vitya", imageName: "wer", subtext: "89675643561"),
                                ImageModel(text: "Ivan", imageName: "bgt", subtext: "89457621783"),
                                ImageModel(text: "Sergey", imageName: "ber", subtext: "89999567843"),
                                ImageModel(text: "Vasya", imageName: "wer", subtext: "89605674326"),
                                ImageModel(text: "Masha", imageName: "tyu", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "tyu", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "kkk", subtext: "89606532561")]
                                   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ColectionViewCell", bundle: nil), forCellWithReuseIdentifier: "galery")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let galery = collectionView.dequeueReusableCell(withReuseIdentifier: "galery", for: indexPath) as! CollectionViewCell
        galery.galeryImage.image = images[indexPath.row].image
        
        return galery
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondViewController = ShowCollectionViewController(imageModel: images[indexPath.row])
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width / 5, height: view.frame.width / 5)
    }
    
}









