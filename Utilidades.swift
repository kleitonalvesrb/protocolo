//
//  Utilidades.swift
//  Protocolo
//
//  Created by Kleiton Batista on 24/12/16.
//  Copyright © 2016 Kleiton Batista. All rights reserved.
//

import UIKit

class Utilidades: NSObject {
    func apresentaMsgAlerta(title: String, msg: String, view: UIViewController){
        let alerta = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        view.present(alerta, animated: true, completion: nil)
        //        self.present(alerta, animated: true, completion: nil)
    }

}
