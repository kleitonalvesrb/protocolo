//
//  TableViewCell.swift
//  Protocolo
//
//  Created by Kleiton Batista on 22/11/16.
//  Copyright © 2016 Kleiton Batista. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblEmpresaReferente: UILabel!
    @IBOutlet weak var lblDataProtocolo: UILabel!
    @IBOutlet weak var lblAssunto: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
