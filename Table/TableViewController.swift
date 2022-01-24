//
//  TableViewController.swift
//  Table
//
//  Created by Сергей Яковлев on 24.01.2022.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    let images: [ImageModel] = [ImageModel(text: "Misha", imageName: "png", subtext: "89994572085"),
                                ImageModel(text: "Masha", imageName: "big", subtext: "89513458976"),
                                ImageModel(text: "Sergey", imageName: "splash", subtext: "89605743561"),
                                ImageModel(text: "Sergey", imageName: "kkk", subtext: "89606532561"),
                                ImageModel(text: "Petr", imageName: "fff", subtext: "89609834561"),
                                ImageModel(text: "Vitya", imageName: "splash", subtext: "89675643561"),
                                ImageModel(text: "Ivan", imageName: "rrr", subtext: "89457621783"),
                                ImageModel(text: "Sergey", imageName: "eee", subtext: "89999567843"),
                                ImageModel(text: "Vasya", imageName: "wer", subtext: "89605674326")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.myLabel.text = images[indexPath.row].text
        cell.myImage.image = images[indexPath.row].image
        cell.telefon.text = images[indexPath.row].subtext
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}



