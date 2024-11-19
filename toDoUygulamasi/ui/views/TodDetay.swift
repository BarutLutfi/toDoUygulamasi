//
//  TodDetay.swift
//  toDoUygulamasi
//
//  Created by Lütfi Barut on 18.11.2024.
//

import UIKit

class TodDetay: UIViewController {
    @IBOutlet weak var tfTodAd: UITextField!
    
    var tod:Tods?

    var viewModel = ToDetayViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t = tod{
            
            tfTodAd.text = t.tod_ad
            
        }
    }
    @IBAction func buttonGuncelle(_ sender: Any) {
        
        
        if let ta = tfTodAd.text , let t = tod{
            viewModel.guncelle(tod_id: t.tod_id!, tod_ad: ta)
            
        }
    }
}
    
    

