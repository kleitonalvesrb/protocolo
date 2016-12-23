//
//  ViewController.swift
//  Protocolo
//
//  Created by Kleiton Batista on 22/11/16.
//  Copyright © 2016 Kleiton Batista. All rights reserved.
//

import UIKit
import Parse
class ViewController: UITableViewController,addProtocoloDelegate {

    @IBOutlet var table: UITableView!
    var protocolos = [Protocolo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "oiiiiii"
        testObject.saveInBackground { (success, error) in
            print("objeto salvo")
        }
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return protocolos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
    
//        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.lblEmpresaReferente.text = protocolos[indexPath.row].nomeEmpresa!
        cell.lblAssunto.text = protocolos[indexPath.row].assunto!
        //cell.lblAssunto.text = "\(protocolos[indexPath.row].data!)"
       // cell.lblDataProtocolo.text = formataDataApresentacao(data: "\(protocolos[indexPath.row].data!)")
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        self.table.reloadData()
    }
    func addProtocolo(_ viewController: UIViewController, protocolo: Protocolo) {
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

}

