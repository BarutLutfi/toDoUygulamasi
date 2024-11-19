//
//  ToKayitViewModel.swift
//  toDoUygulamasi
//
//  Created by Lütfi Barut on 18.11.2024.
//

import Foundation

class ToKayitViewModel{
    
    var trepo = TodDaoRepository()
    func kaydet (tod_ad:String){
        trepo.kaydet(tod_ad: tod_ad)
        
        
    }
}
