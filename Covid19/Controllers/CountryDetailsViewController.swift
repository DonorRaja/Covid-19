//
//  CountryDetailsViewController.swift
//  Covid19
//
//  Created by DonorRaja on 21/04/20.
//  Copyright © 2020 DonorRaja. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var newRecoveredLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var recoveredView: UIView!
    @IBOutlet weak var deathsView: UIView!
    @IBOutlet weak var confirmedView: UIView!
    
    //MARK: - Variables
    var countryDetails = CountryDetails()
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.countryDetails.countryName
        self.dateLabel.text = Utilities.convertDateFormater(requestDate: self.countryDetails.caseDetail.date!)
        self.newConfirmedLabel.text = "New Confirmed: \(self.countryDetails.caseDetail.newConfirmed.delimiter)"
        self.totalConfirmedLabel.text = "Total Confirmed: \(self.countryDetails.caseDetail.totalConfirmed.delimiter)"
        self.newDeathsLabel.text = "New Deaths: \(self.countryDetails.caseDetail.newDeaths.delimiter)"
        self.totalDeathsLabel.text = "Total Deaths: \(self.countryDetails.caseDetail.totalDeaths.delimiter)"
        self.newRecoveredLabel.text = "New Recovered: \(self.countryDetails.caseDetail.newRecovered.delimiter)"
        self.totalRecoveredLabel.text = "Total Recovered: \(self.countryDetails.caseDetail.totalRecovered.delimiter)"
        
    }
     

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
