//
//  Tods.swift
//  toDoUygulamasi
//
//  Created by Lütfi Barut on 18.11.2024.
//

import Foundation


class Tods {
    
    
    
    var tod_id : Int?
    var tod_ad : String?
    
    init(){
        
    }
    
 init(tod_id: Int, tod_ad: String?) {
       self.tod_id = tod_id
        self.tod_ad = tod_ad
    }
}
