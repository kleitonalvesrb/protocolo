//
//  AddProtocoloViewController.swift
//  Protocolo
//
//  Created by Kleiton Batista on 22/11/16.
//  Copyright © 2016 Kleiton Batista. All rights reserved.
//

import UIKit
protocol addProtocoloDelegate{
    func addProtocolo(_ viewController: UIViewController, protocolo: Protocolo)
}
class AddProtocoloViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var delegate: addProtocoloDelegate?

    @IBOutlet weak var numeroProtocolo: UITextField!
    @IBOutlet weak var empresa: UITextField!
    @IBOutlet weak var assunto: UITextField!
    @IBOutlet weak var data: UIDatePicker!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var btnSalvar: UIButton!
    @IBOutlet weak var constraintInferior: NSLayoutConstraint!
    
    @IBOutlet weak var scroll: UIScrollView!
    var acrescimo:CGFloat!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("foi")
        if self.view.frame.height < 650{
            scroll.isScrollEnabled = true
        }
        setDelegateFields()

//        let gesto = UITapGestureRecognizer(target:self, action: #selector(acaoToqueTextView))
//        descricao.addGestureRecognizer(gesto)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
   
    }
    func setDelegateFields(){
        empresa.delegate = self
        descricao.delegate = self
        assunto.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func acaoToqueTextView(){
        NotificationCenter.default.addObserver(self, selector: #selector(AddProtocoloViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddProtocoloViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @IBAction func salvar(_ sender: AnyObject) {
        print("pegar a ação quando clicar no campo descricao")
        print(data.date)
        let protocolo = Protocolo()
        protocolo.numeroProtocolo = numeroProtocolo.text
        protocolo.nomeEmpresa = empresa.text
        protocolo.assunto = assunto.text
        protocolo.descricao = descricao.text
        protocolo.data = data.date
        print(data.date)
        delegate?.addProtocolo(self, protocolo: protocolo)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    /*Retirar o teclado*/
    func dismissKeyboard(){
        alteraPosicaoTelaTamanhoScroll(valorX: -40)

        self.view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        /* Configuração de tamanho da tela, ajusta no tamanho exato de cada dispositivo*/
        
            alteraPosicaoTelaTamanhoScroll(valorX: 180)
       
      

    
    }
    func alteraPosicaoTelaTamanhoScroll(valorX: CGFloat){
        scroll.contentSize =  CGSize(width: 0, height: self.view.frame.height + valorX)
        scroll.setContentOffset(CGPoint(x: 0, y: valorX), animated: true)
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("clicou")
    }
    
    func adjustingHeight(_ show:Bool, notification:Notification) {
        // 1
        var userInfo = notification.userInfo!
        // 2
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        // 3
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        // 4
        let changeInHeight = (keyboardFrame.height + 40) * (show ? 1 : -1)
        acrescimo = (keyboardFrame.height) * (show ? 1 : -1)
        //5
        UIView.animate(withDuration: animationDurarion, animations: { () -> Void in
            self.constraintInferior.constant =  self.constraintInferior.constant + changeInHeight
        })
        
    }
    func keyboardWillShow(_ notification:Notification) {
        adjustingHeight(true, notification: notification)
        
        scroll.setContentOffset(CGPoint(x: 0, y: acrescimo - 40), animated: true)
        removeNotificationCenter()
    }
    
    func keyboardWillHide(_ notification:Notification) {
        adjustingHeight(false, notification: notification)
    }
    override func viewWillDisappear(_ animated: Bool) {
        removeNotificationCenter()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeNotificationCenter()
        self.view.endEditing(true)
    }
    func removeNotificationCenter(){
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool{
        var maxLength = 500
        var currentString: NSString!
        var newString: NSString!
        
        if textField == numeroProtocolo{
            maxLength = 50
            currentString = numeroProtocolo.text! as NSString!
            newString = currentString.replacingCharacters(in: range, with: string) as NSString!
            return newString.length <= maxLength
        }else if textField == empresa{
            maxLength = 50
            currentString = empresa.text! as NSString!
            newString = currentString.replacingCharacters(in: range, with: string) as NSString!
            return newString.length <= maxLength
        }else if textField == assunto{
            maxLength = 16
            currentString = assunto.text! as NSString!
            newString = currentString.replacingCharacters(in: range, with: string) as NSString!
            return newString.length <= maxLength
        }else{
            newString = currentString.replacingCharacters(in: range, with: string) as NSString!
            return newString.length <= maxLength
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
