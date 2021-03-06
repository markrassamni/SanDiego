//
//  tableCells.swift
//  San Diego
//
//  Created by Mark Rassamni on 8/1/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class tableCells: UITableViewCell {

    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImg.layer.cornerRadius = mainImg.frame.size.width/2
        mainImg.clipsToBounds = true
        
        if UIDevice.currentDevice().model == "iPad" {
            mainImg.layer.cornerRadius = 100
        }
        
        
        
    }
    
    func configureCell(image: UIImage, text: String){
        mainImg.image = image
        mainLbl.text = text
    }
    


}
