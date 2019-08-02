//
//  DetailViewController.swift
//  TestAppleRobertoG
//
//  Created by Dragon on 01/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

protocol DetailsProtocol {
 func showImage(image:String)
}


class DetailViewController: UIViewController, DetailsProtocol {
    

    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailTextView: UITextView!
    

    var detail: String?
    var imageStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Detail"

        
        if let detailStr = detail {
        
            detailTextView.text = detailStr
        
        }
        
        if let image = imageStr {
            showImage(image: image)
        }
        

    }
    
    func showImage(image:String){
        // for image
        
        let urlStringF = "https://image.tmdb.org/t/p/w500/" + image
        
        let imgURL: URL = URL(string: urlStringF)!
        let request: URLRequest = URLRequest(url: imgURL)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    self.detailImage.image = UIImage(data: data!)
                }
                // GCD in main thread
                DispatchQueue.main.async(execute: display_image)
            }
            
        })
        
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
