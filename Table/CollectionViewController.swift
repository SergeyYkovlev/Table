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
    
    let mi = ["big","splash","png","reb","rew","big","bgt","ber","rrr","kkk","jjj","ttt","fff","eee","fds","hgt","fds","ddd","big","splash","png","reb","rew","big","bgt","ber","rrr","kkk","jjj","ttt","fff","eee","fds","hgt","hgt-1","ddd","big","splash","png","reb","rew","big","bgt","ber","rrr","kkk","jjj","ttt","fff","eee","fds","hgt","hgt-1","ddd","big","splash","png","reb","rew","big","bgt","ber","rrr","kkk","jjj","ttt","fff","eee","fds","hgt","hgt-1","ddd","big","splash","png","reb","rew","big","bgt","ber","rrr","kkk","jjj","ttt","fff","eee","fds","hgt","hgt-1","ddd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ColectionViewCell", bundle: nil), forCellWithReuseIdentifier: "galery")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let galery = collectionView.dequeueReusableCell(withReuseIdentifier: "galery", for: indexPath) as! CollectionViewCell
        
        galery.galeryImage.image = UIImage(named: mi[indexPath.row])
        
        return galery
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width / 5, height: view.frame.width / 5)
    }
    
}









