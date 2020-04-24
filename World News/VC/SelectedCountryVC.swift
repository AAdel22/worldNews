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
    var mainCategories = CategoriesNewsVC()
    var countryName = ""
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
        countryName = countries[row]
        if countryName == "Egypt" {
            countryName = "eg"
        }else if countryName == "China" {
            countryName = "cn"
        }else if countryName == "Italy" {
            countryName = "it"
        }else if countryName == "United States" {
            countryName = "us"
        }else if countryName == "United Kingdom" {
            countryName = "gb"
        }else if countryName == "France" {
            countryName = "fr"
        }else if countryName == "Germany" {
            countryName = "de"
        }
        
    }

    @IBAction func nextBtn(_ sender: Any) {
        print(countryName)
        performSegue(withIdentifier: "segueCountryName", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newsVC = segue.destination as! NewsVC
        newsVC.countryName = countryName
        
        present(newsVC, animated: true, completion: nil)
    }
    
}

