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
    var noticia: String
    var fecha: String
    var imagen: String
    
    init(titulo:String, noticia:String, fecha:String, imagen: String) {
        
        self.titulo = titulo
        self.noticia = noticia
        self.fecha = fecha
        self.imagen = imagen
        
    }
    
}



class DataManager: NSObject {
    
    var titulo: String = ""
    var noticia: String = ""
    var fecha: String = ""
    var imagen: String = ""
    
    
}
