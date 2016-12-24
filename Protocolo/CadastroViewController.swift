//
//  CadastroViewController.swift
//  Protocolo
//
//  Created by Kleiton Batista on 24/12/16.
//  Copyright © 2016 Kleiton Batista. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var confirmarEmail: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmarSenha: UITextField!
    @IBOutlet weak var btnCadastro: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func efetuarCadastro(_ sender: Any) {
                
        
        if !Validadores().validaTamanhoCampo(nome.text!, tamanhoMin: 3){
            Utilidades().apresentaMsgAlerta(title: "Dado Incorreto", msg: "O campo nome deve conter no mínimo 3 caracteres", view: self)
        }else if !Validadores().validaTamanhoCampo(email.text!, tamanhoMin: 6){
            Utilidades().apresentaMsgAlerta(title: "Dado Incorreto", msg: "O campo email deve conter no mínimo 6 caracteres", view: self)
        }else if !Validadores().validaTamanhoCampo(senha.text!, tamanhoMin: 6){
            Utilidades().apresentaMsgAlerta(title: "Dado Incorreto", msg: "A senha deve conter no mínimo 6 caracteres", view: self)
        }else{
            if !Validadores().comparaString(str1: email.text!, str2: confirmarEmail.text!){
                Utilidades().apresentaMsgAlerta(title: "Dado Incorreto", msg: "Email informado não são iguais", view: self)
            }else if !Validadores().comparaString(str1: senha.text!, str2: confirmarSenha.text!){
                Utilidades().apresentaMsgAlerta(title: "Dado Incorreto", msg: "As senhas informada não são iguais", view: self)
            }else{
                let user = Usuario(nome: nome.text!, email: email.text!, senha: senha.text!)
                
                Utilidades().apresentaMsgAlerta(title: "Tudo certo", msg: "realizar cadastro do usuario", view: self)
            }
        }
        
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
