//
//  CountryViewController.swift
//  Covid19
//
//  Created by DonorRaja on 21/04/20.
//  Copyright © 2020 DonorRaja. All rights reserved.
//

import UIKit
import FlagKit


class CountryViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var countryTableView: UITableView!
    
    //MARK: - Variables
    var countryListData = [CountryDetails]()
    
   //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countryListData = Singleton.sharedInstance.countryListData
        self.countryTableView.dataSource = self
        self.countryTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.countryTableView.reloadData()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let viewController = segue.destination as? CountryDetailsViewController {
            viewController.countryDetails = self.countryListData[sender as! Int]
        }
    }

}

//MARK: - TableviewDelegates and TableViewDataSource
extension CountryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryTableViewCell
        let countryData = self.countryListData[indexPath.row]
        cell.countryName.text = countryData.countryName
        let totalActiveCases = ((countryData.caseDetail.totalConfirmed) - (countryData.caseDetail.totalRecovered))
        cell.totalCases.text = "Total Active Cases: \(totalActiveCases.delimiter)"
        //let countryCode = Locale.current.regionCode!
        if let flag = Flag(countryCode: countryData.countryCode!){
            cell.flagImageView.image = flag.originalImage
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.countryTableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "countryDetailsView", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}
