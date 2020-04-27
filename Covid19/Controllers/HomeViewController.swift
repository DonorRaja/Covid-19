//
//  ViewController.swift
//  Covid19
//
//  Created by DonorRaja on 20/04/20.
//  Copyright © 2020 DonorRaja. All rights reserved.
//

import UIKit
import AFNetworking

class HomeViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var lastUpdatedDate: UILabel!
    @IBOutlet weak var totalCases: UILabel!
    @IBOutlet weak var totalDeaths: UILabel!
    @IBOutlet weak var totalRecovered: UILabel!
    @IBOutlet weak var newCases: UILabel!
    @IBOutlet weak var newDeaths: UILabel!
    @IBOutlet weak var newRecovered: UILabel!
    @IBOutlet weak var countryWiseButton: UIButton!
    
    //MARK: - Variables
    var globalCasesData = GlobalCasses()

    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getGlobalSummaryCases()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //MARK: - Button Actions
    @IBAction func countryWiseButtonAction(_ sender: UIButton) {
        
        
    }
    
    //MARK: - Other Functions
    func loaderActivity(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }

    
    func getGlobalSummaryCases(){
        
        self.loaderActivity()
        NetworkManager.globalCasesRequestWithJsonResponse { (response, error) in
            
            if error == nil {
                self.dismiss(animated: true, completion: nil)
                self.globalCasesData = Singleton.sharedInstance.globalCases
                let date = Utilities.convertDateFormater(requestDate: self.globalCasesData.date!)
                self.lastUpdatedDate.text = date
                self.totalDeaths.text = "\((self.globalCasesData.totalDeaths).delimiter)"
                self.totalRecovered.text = "\((self.globalCasesData.totalRecovered).delimiter)"
                self.totalCases.text = "\((self.globalCasesData.totalConfirmed).delimiter)"
                self.newCases.text = "\((self.globalCasesData.newConfirmed).delimiter)"
                self.newDeaths.text = "\((self.globalCasesData.newDeaths).delimiter)"
                self.newRecovered.text = "\((self.globalCasesData.newRecovered).delimiter)"
            }else {
                self.dismiss(animated: true, completion: nil)
                print(error.debugDescription)
            }
            
        }
    }

    
    
}

