//
//  InitViewController.swift
//  Protocolo
//
//  Created by Kleiton Batista on 23/12/16.
//  Copyright © 2016 Kleiton Batista. All rights reserved.
//

import UIKit

class InitViewController: UIViewController, UITableViewDataSource,addProtocoloDelegate {

//    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var constraintLateral: NSLayoutConstraint!
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var table: UITableView!
    var menuShowing = false
    var protocolos = [Protocolo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewMenu.layer.shadowOpacity = 1
        viewMenu.layer.shadowRadius = 6
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(InitViewController.menu(_:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(InitViewController.menu(_:)))
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menu(_ sender: Any) {
        if menuShowing{
            constraintLateral.constant = -140
        }else{
            constraintLateral.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()

            })
        }
        menuShowing = !menuShowing
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return protocolos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InitTableViewCell
        
        cell.lblNomeEmpresa.text = protocolos[indexPath.row].nomeEmpresa!
        cell.lblAssunto.text = protocolos[indexPath.row].assunto!

        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        self.table.reloadData()
    }
    func addProtocolo(_ viewController: UIViewController, protocolo: Protocolo) {
        print("--------> \(protocolo.nomeEmpresa)")
        protocolos.append(protocolo)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueAddProtocolo"{
            let protoloVc:AddProtocoloViewController = segue.destination as! AddProtocoloViewController
            protoloVc.delegate = self
        }
    }
    func formataDataApresentacao(data:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss +0000"
        let date = dateFormatter.date(from: data)
        print("date é aqui -->\(date)")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        print(data)
        print(dateFormatter.string(from: date!))
        return dateFormatter.string(from: date!)
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
