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
    
    private var _name: String!
    private var _img: UIImage!
    private var _description: String!
        
    var img: UIImage{
            return _img
    }
    
    var description: String{
            return _description
    }
    
    var name: String {
        return _name
    }
    
    
    init(img: UIImage, description: String, name: String){
        _img = img
        _description = description
        _name = name
    }

    
}
