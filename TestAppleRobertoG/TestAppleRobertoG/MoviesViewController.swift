//
//  MoviesViewController.swift
//  TestAppleRobertoG
//
//  Created by Dragon on 01/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var moviesTableView: UITableView!
    
    
    var arr = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        arr = ["Uno", "Dos", "Tres", "Cuatro"]
        
        let nibName = UINib.init(nibName: "MoviesTableViewCell", bundle: Bundle.main)
        
        moviesTableView.register(nibName, forCellReuseIdentifier: "MoviesTableViewCell")
        
        
        moviesTableView.delegate = self
        moviesTableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
        //return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath)
        
        guard let newCell = cell as? MoviesTableViewCell else {return cell}
        
        newCell.labelCell.text = arr[indexPath.row]
        
//        //        newCell.nombreLabelCell.text = arr[indexPath.row]
//        let items = productos[indexPath.row]
//        newCell.nombreLabelCell.text = items.titulo
//        newCell.noticiaLabelCell.text = items.noticia
//        newCell.fechaLabelCell.text = items.noticia
        
        return newCell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
