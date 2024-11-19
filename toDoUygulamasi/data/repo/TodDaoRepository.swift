//
//  TodDaoRepository.swift
//  toDoUygulamasi
//
//  Created by Lütfi Barut on 18.11.2024.
//

import Foundation
import RxSwift


class TodDaoRepository{
    
    var todListesi = BehaviorSubject<[Tods]>(value: [Tods]())
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTbaniUrl = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDos.sqlite")
        
        db = FMDatabase(path: veriTbaniUrl.path)
        
    }
    
    func kaydet (tod_ad:String){
        db?.open()
        
            do{
            
                 try db!.executeUpdate("INSERT INTO toDos (tod_ad) VALUES (?)",
                                       values: [tod_ad])
             
        }catch{
            
            print(error.localizedDescription)
            
        }
        
        db?.close()
        
        
    }
    
    
    func guncelle (tod_id :Int , tod_ad:String){
        db?.open()
        
            do{
            
                 try db!.executeUpdate("UPDATE toDos SET tod_ad = ? WHERE tod_id = ?",
                                       values: [tod_ad , tod_id])
             
        }catch{
            
            print(error.localizedDescription)
            
        }
        
        db?.close()
    }
    
    func sil(tod_id:Int){
        db?.open()
        
            do{
            
                 try db!.executeUpdate("DELETE FROM toDos WHERE tod_id = ?",
                                       values: [tod_id])
                todlarıYukle()
            }catch{
            
            print(error.localizedDescription)
            
        }
        
        db?.close()
        todlarıYukle()
    }
    
    func ara (aramaKelimesi : String){
        
        db?.open()
        
        var liste = [Tods]()
        
        do{
            
            let rs = try db!.executeQuery("SELECT * FROM toDos WHERE tod_ad like '%\(aramaKelimesi)%'", values: nil)
            while rs.next(){
                
                let tod = Tods(tod_id: Int(rs.string(forColumn: "tod_id"))!,
                               tod_ad: rs.string(forColumn: "tod_ad")!)
                
                liste.append(tod)
                
            }
            todListesi.onNext(liste)
        }catch{
            
            print(error.localizedDescription)
            
        }
        
        db?.close()

    }
    
    func todlarıYukle (){
        
        db?.open()
        
        var liste = [Tods]()
        
        do{
            
            let rs = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            while rs.next(){
                
                let tod = Tods(tod_id: Int(rs.string(forColumn: "tod_id"))!,
                               tod_ad: rs.string(forColumn: "tod_ad")!)
                
                liste.append(tod)
                
            }
            todListesi.onNext(liste)
        }catch{
            
            print(error.localizedDescription)
            
        }
        
        db?.close()
    }
    
}


