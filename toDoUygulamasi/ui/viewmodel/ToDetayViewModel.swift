//
//  ToDetayViewModel.swift
//  toDoUygulamasi
//
//  Created by Lütfi Barut on 18.11.2024.
//

import Foundation


class ToDetayViewModel{
    
    var trepo = TodDaoRepository()
    
    func guncelle (tod_id :Int , tod_ad:String){
        trepo.guncelle(tod_id: tod_id, tod_ad: tod_ad)
    }
}
