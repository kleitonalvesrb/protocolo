//
//  InitTableViewCell.swift
//  Protocolo
//
//  Created by Kleiton Batista on 24/12/16.
//  Copyright © 2016 Kleiton Batista. All rights reserved.
//

import UIKit

class InitTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNomeEmpresa: UILabel!
    @IBOutlet weak var lblData: UILabel!
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
