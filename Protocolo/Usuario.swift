//
//  Usuario.swift
//  Protocolo
//
//  Created by Kleiton Batista on 24/12/16.
//  Copyright © 2016 Kleiton Batista. All rights reserved.
//

import UIKit

class Usuario: NSObject {
     var nome:String? = ""
     var email:String? = ""
     var senha:String? = ""
    
    override init() {
        
    }
    init(nome:String, email:String, senha:String) {
        self.nome = nome
        self.email = email
        self.senha = senha
    }
}
