//
//  ViewController.swift
//  toDoUygulamasi
//
//  Created by Lütfi Barut on 18.11.2024.
//

import UIKit

class Anasayfa: UIViewController{

    @IBOutlet weak var todTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var todListesi = [Tods]()
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        todTableView.delegate = self
        todTableView.dataSource = self
        
        _ = viewModel.todListesi.subscribe(onNext: { liste in
            self.todListesi = liste
            self.todTableView.reloadData()
            
        })
       
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.todlarıYukle()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            
            if let tod = sender as? Tods{
                
                let gidilcecekVc = segue.destination as! TodDetay
                gidilcecekVc.tod = tod
                
            }
            
        }
    }
}

extension Anasayfa : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tod = todListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "todHucre") as! TodHucre
        
        hucre.labelTodAd.text = tod.tod_ad
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tod = todListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: tod)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){contextualAction,view,bool in
            let tod = self.todListesi[indexPath.row]
            
            let alert = UIAlertController(title:"Silme İşlemi" , message: "\(tod.tod_ad!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAciton = UIAlertAction(title: "İptal", style: .cancel)
            
            alert.addAction(iptalAciton)
            
            
            let evetAciton = UIAlertAction(title: "Evet", style: .destructive){action in
                self.viewModel.sil(tod_id: tod.tod_id!)
                
                
            }
            
            alert.addAction(evetAciton)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}
 
