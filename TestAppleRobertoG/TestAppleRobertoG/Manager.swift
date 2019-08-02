//
//  Manager.swift
//  TestAppleRobertoG
//
//  Created by Dragon on 01/08/19.
//  Copyright © 2019 Roberto Gonzalez C. All rights reserved.
//

import UIKit

class ManagerData: NSObject {
    
    var titulo: String
    var language: String
    var rating: Int
    var imagen: String
    
    init(titulo:String, language:String, rating:Int, imagen: String) {
        
        self.titulo = titulo
        self.language = language
        self.rating = rating
        self.imagen = imagen
        
    }
    
}


class DataManager: NSObject {
    
    var titulo: String = ""
    var noticia: Int = 0
    var fecha: String = ""
    var imagen: String = ""
    
    
}
