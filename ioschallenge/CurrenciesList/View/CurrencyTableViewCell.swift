//
//  CurrencyTableViewCell.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/24/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var isoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.10
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UIColor.lightGray.cgColor
        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
