//
//  TodKayit.swift
//  toDoUygulamasi
//
//  Created by Lütfi Barut on 18.11.2024.
//

import UIKit

class TodKayit: UIViewController {

    @IBOutlet weak var tfTodAd: UITextField!
    
    var viewModel = ToKayitViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
   @IBAction func buttonKaydet(_ sender: Any) {
       
       if let ka = tfTodAd.text{
           
           viewModel.kaydet(tod_ad: ka)
           
       }
       
    }
}
