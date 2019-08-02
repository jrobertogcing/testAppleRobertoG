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
    var overview: String

    
    init(titulo:String, language:String, rating:Int, imagen: String, overview:String) {
        
        self.titulo = titulo
        self.language = language
        self.rating = rating
        self.imagen = imagen
        self.overview = overview

    }
    
}
