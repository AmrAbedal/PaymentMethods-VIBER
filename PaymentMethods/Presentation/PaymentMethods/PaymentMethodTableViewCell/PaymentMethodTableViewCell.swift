//
//  PaymentMethodTableViewCell.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import UIKit


class PaymentMethodTableViewCell: UITableViewCell {
    static let identifier = "PaymentMethodTableViewCell"
    
    @IBOutlet weak var methodIcon: UIImageView!
    @IBOutlet weak var methodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PaymentMethodTableViewCell: PaymentMethodTableViewCellProtocol {
    func configure(model: PaymentMethodViewModel) {
        methodIcon.image = UIImage()
        methodNameLabel.text = model.label
    }
    
}
