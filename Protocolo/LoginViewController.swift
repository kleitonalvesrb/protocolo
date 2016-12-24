//
//  LoginViewController.swift
//  Protocolo
//
//  Created by Kleiton Batista on 24/12/16.
//  Copyright © 2016 Kleiton Batista. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var btnEntrar: UIButton!
    @IBOutlet weak var btnCadastrar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func EfetuarLogin(_ sender: Any) {
        if !Validadores().validaTamanhoCampo(login.text!, tamanhoMin: 1) || !Validadores().validaTamanhoCampo(senha.text!, tamanhoMin: 1){
            Utilidades().apresentaMsgAlerta(title: "Ops!", msg: "Os campos devem ser devidamente preenchidos", view: self)
        }else{
            
        }
    }
    @IBAction func Cadastrar(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
