//
//  ViewController.swift
//  World News
//
//  Created by Alaa Adel on 4/22/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class SelectedCountryVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    
    let countries: [Countries] = [
    .unitedStates, .china, .italy, .egypt, .unitedKingdom, .france, .germany
    ]
    var selectedCountry: Countries?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row].rawValue.uppercased()
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countries[row]
    }

    @IBAction func nextBtn(_ sender: Any) {
        
        guard let selectedCountry = selectedCountry ?? countries.first else {
            // show alert to select Country
            return
        }
        
        let newsVC = storyboard?.instantiateViewController(withIdentifier: "NewsVC") as! NewsVC
        
        newsVC.countryName = selectedCountry.name
        newsVC.modalPresentationStyle = .fullScreen
        present(newsVC, animated: true, completion: nil)
    }
}
enum Countries: String {
    case unitedStates
    case china
    case italy
    case egypt
    case unitedKingdom
    case france
    case germany
    
    var name: String {
        switch self {
        case .unitedStates:
            return "us"
        case .china:
            return "cn"
        case .italy:
            return "it"
        case .egypt:
            return "eg"
        case .unitedKingdom:
            return "gb"
        case .france:
            return "fr"
        case .germany:
            return "de"
        }
    }
}
