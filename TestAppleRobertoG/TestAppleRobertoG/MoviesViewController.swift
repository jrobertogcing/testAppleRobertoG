//
//  MoviesViewController.swift
//  TestAppleRobertoG
//
//  Created by Dragon on 01/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController{

    @IBOutlet weak var moviesTableView: UITableView!
    
    var arrayObject : [ManagerData] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // For custom Cell
        let nibName = UINib.init(nibName: "MoviesTableViewCell", bundle: Bundle.main)
        moviesTableView.register(nibName, forCellReuseIdentifier: "MoviesTableViewCell")
        
        // Delegate and Data Sourse for Table View
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
        // Parcing data JSON
        let JSONAdpaterCall = JSONAdapter()
        
        JSONAdpaterCall.jsonGetURL(){
            
            list in
            
            if list != nil {
                self.arrayObject = list!
            }
            // GCD in main thread
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

// Extension
extension MoviesViewController : UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath)
        
        guard let newCell = cell as? MoviesTableViewCell else {return cell}
        
        let datosCelda = arrayObject[indexPath.row]
        
        newCell.labelCell.text = datosCelda.titulo
        if datosCelda.language == "en" {
            newCell.ratingLabelCell.text = "Language: English"
        } else {
            newCell.ratingLabelCell.text = "Language: Foreing"
        }
        newCell.lenguageLabelCell.text = "Rating:" + String(datosCelda.rating)

        
        // for image
        
        let urlString = datosCelda.imagen
        let urlStringF = "https://image.tmdb.org/t/p/w500/" + datosCelda.imagen
        
        
        let imgURL: URL = URL(string: urlStringF)!
        let request: URLRequest = URLRequest(url: imgURL)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    newCell.imageCell.image = UIImage(data: data!)
                    
                }
                // GCD in main thread
                DispatchQueue.main.async(execute: display_image)
            }
            
        })
        
        task.resume()
        
        
        
        
        return newCell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}

extension MoviesViewController : UITableViewDataSource {
    
    
}


