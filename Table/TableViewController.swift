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
    
    let number = ["89994572085", "89513458976", "89605743561"]
    let text = ["Misha", "Masha", "Sergey"]
    let animals = ["png", "big", "splash"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell


        cell.myImage.image = UIImage(named: animals[indexPath.row])
        cell.myLabel.text = text[indexPath.row]
        cell.telefon.text = number[indexPath.row]

        return(cell)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    

}

