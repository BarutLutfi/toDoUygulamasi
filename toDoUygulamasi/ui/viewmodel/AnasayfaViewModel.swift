//
//  AnasayfaViewModel.swift
//  toDoUygulamasi
//
//  Created by Lütfi Barut on 18.11.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var trepo = TodDaoRepository()
    var todListesi = BehaviorSubject<[Tods]>(value: [Tods]())
    
    init(){
        veritabaniKopyala()
        todListesi = trepo.todListesi
        todlarıYukle()
    }

    func sil(tod_id:Int){
        trepo.sil(tod_id: tod_id)
    }
    
    func ara (aramaKelimesi : String){
        
        trepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func todlarıYukle (){
        trepo.todlarıYukle()
        
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "toDos", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDos.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{}
        }
        
    }
    
}
