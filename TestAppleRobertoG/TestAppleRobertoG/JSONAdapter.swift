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
        let urlApple = URL(string:"http://movil.aztecanoticias.com.mx/ultimas/ultnot.json")
        let task = URLSession.shared.dataTask(with: urlApple!) {(data, response, error) in
            
            if error != nil {
                print("ERROR URL OR INTERNET CONECTION")
                print(error!)
                
            } else{
                
                do{
                    let rootJSONDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    
                    if let items = rootJSONDictionary["items"] as? [[String: Any]]{
                     
                        print("reading JSON")
                        
                        for everyItems in items {
                        
                            guard let fecha = everyItems["fecha"]  as! String? else {return}
                            guard let titulo = everyItems["titulo"]  as! String? else {return}
                            guard let imagen = everyItems["imagen"]  as! String? else {return}
                            guard let autor = everyItems["autor"]  as! String? else {return}
                            
                            arrayObjectAdapter.append(ManagerData(titulo: titulo, noticia: autor, fecha: fecha, imagen: imagen))
                        }// end for
                        
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
