//
//  ToDo.swift
//  San Diego
//
//  Created by Mark Rassamni on 8/1/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import Foundation
import UIKit

class ToDo {
    
    private var _img: UIImage!
    private var _description: String!
        
    var img: UIImage{
        get{
            return _img
        }
    }
    
    var description: String{
        get{
            return _description
        }
    }
    
    
    init(img: UIImage, description: String){
        _img = img
        _description = description
    }

    
}
