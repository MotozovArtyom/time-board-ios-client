//
//  AddListButtonViewCollectionViewCell.swift
//  time-board
//
//  Created by Tianid on 16.06.2020.
//  Copyright © 2020 Tianid. All rights reserved.
//

import UIKit

class AddListButtonViewCollectionViewCell: UICollectionViewCell {
    
    weak var parentVC: BoardCollectionControllerProtocol?

    @IBAction func addListButtonAction(_ sender: UIButton) {
        parentVC?.showAlertForNewList()


    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10.0
        // Initialization code
    }

}