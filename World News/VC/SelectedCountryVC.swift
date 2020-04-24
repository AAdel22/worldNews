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
    
    let countries = ["United States","China","Italy","Egypt","United Kingdom","France","Germany"]
    var mainCategories = MainCategories()
    
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
        return countries[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mainCategories.countryName = countries[row]
        
    }

    @IBAction func nextBtn(_ sender: Any) {
        if mainCategories.countryName == "Egypt" {
            mainCategories.countryName = "eg"
        }else if mainCategories.countryName == "China" {
            mainCategories.countryName = "cn"
        }else if mainCategories.countryName == "Italy" {
            mainCategories.countryName = "it"
        }else if mainCategories.countryName == "United States" {
            mainCategories.countryName = "us"
        }else if mainCategories.countryName == "United Kingdom" {
            mainCategories.countryName = "gb"
        }else if mainCategories.countryName == "France" {
            mainCategories.countryName = "fr"
        }else if mainCategories.countryName == "Germany" {
            mainCategories.countryName = "de"
        }
        print(mainCategories.countryName)
        performSegue(withIdentifier: "segueCountryName", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newsVC = segue.destination as! NewsVC
        newsVC.countryName = mainCategories.countryName
        
        present(newsVC, animated: true, completion: nil)
    }
    
}

