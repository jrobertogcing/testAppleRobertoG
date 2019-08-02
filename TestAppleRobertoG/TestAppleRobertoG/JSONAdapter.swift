//
//  JSONAdapter.swift
//  TestAppleRobertoG
//
//  Created by Dragon on 01/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class JSONAdapter: NSObject {
    
    func jsonGetURL(completion: @escaping ([ManagerData]?) -> Void) {
        
        var arrayObjectAdapter : [ManagerData] = []
        let urlStr = "https://api.themoviedb.org/3/movie/popular?api_key=eb14b75c09535ee482a6af08c41cc63b&language=en-US&page=1&region=USA"
        let urlApple = URL(string:urlStr)
        let task = URLSession.shared.dataTask(with: urlApple!) {(data, response, error) in
            
            if error != nil {
                print("ERROR URL OR INTERNET CONECTION")
                print(error!)
                
            } else{
                
                do{
                    let rootJSONDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                    if let items = rootJSONDictionary["results"] as? [[String: Any]]{
                     
                        for everyItems in items {
                        
                            guard let rating = everyItems["vote_average"]  as! Int? else {return}
                            guard let titulo = everyItems["title"]  as! String? else {return}
                            guard let imagen = everyItems["poster_path"]  as! String? else {return}
                            guard let language = everyItems["original_language"]  as! String? else {return}
                            guard let overview = everyItems["overview"]  as! String? else {return}

                            
                            
                            arrayObjectAdapter.append(ManagerData(titulo: titulo, language: language, rating: rating, imagen: imagen, overview:overview))
                        }

                    }// end if
                    
                }// end do
                catch{
                    
                    print("Error Catch")
                    
                    completion(nil)
                    
                    return
                    
                } //end catch
                
                completion(arrayObjectAdapter)
                
            } // end else
        }// end let task data, response, error
        task.resume()
    }
    
}
