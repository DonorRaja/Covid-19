//
//  Global.swift
//  Covid19
//
//  Created by DonorRaja on 20/04/20.
//  Copyright © 2020 DonorRaja. All rights reserved.
//

import Foundation


class GlobalCasses: NSObject {
    var newConfirmed: Int = 0
    var totalConfirmed: Int = 0
    var newDeaths: Int = 0
    var totalDeaths: Int = 0
    var newRecovered: Int = 0
    var totalRecovered: Int = 0
    var date: String?

}

class CountryDetails: NSObject {
    var countryName: String?
    var countryCode: String?
    var caseDetail = GlobalCasses()
    var slung: String?
    
}

class GlobalCasesDetails: NSObject {
    
    var globalCases = GlobalCasses()
    var countriesData = [CountryDetails]()
    public init(caseResponse: [String: AnyObject]) {
        super.init()
       
        print(caseResponse)
        self.globalCases.date = caseResponse["Date"] as? String
        if let globalCase = caseResponse["Global"] as? [String: AnyObject] {
            self.globalCases.newConfirmed = globalCase["NewConfirmed"] as? Int ?? 0
            self.globalCases.totalConfirmed = globalCase["TotalConfirmed"] as? Int ?? 0
            self.globalCases.newDeaths = globalCase["NewDeaths"] as? Int ?? 0
            self.globalCases.totalDeaths = globalCase["TotalDeaths"] as? Int ?? 0
            self.globalCases.newRecovered = globalCase["NewRecovered"] as? Int ?? 0
            self.globalCases.totalRecovered = globalCase["TotalRecovered"] as? Int ?? 0
            //Singleton.sharedInstance.globalCases = self.globalCases
        }
        Singleton.sharedInstance.globalCases = self.globalCases
        
        for countryList in caseResponse["Countries"] as! NSArray {
            if let countryData = countryList as? [String: AnyObject] {
                let countries = CountryDetails()
                countries.countryName = countryData["Country"] as? String
                countries.countryCode = countryData["CountryCode"] as? String
                countries.slung = countryData["Slug"] as? String
                countries.caseDetail.date = countryData["Date"] as? String
                countries.caseDetail.newRecovered = countryData["NewRecovered"] as! Int
                countries.caseDetail.newDeaths = countryData["NewDeaths"] as! Int
                countries.caseDetail.newConfirmed = countryData["NewConfirmed"] as! Int
                countries.caseDetail.totalRecovered = countryData["TotalRecovered"] as! Int
                countries.caseDetail.totalDeaths = countryData["TotalDeaths"] as! Int
                countries.caseDetail.totalConfirmed = countryData["TotalConfirmed"] as! Int
                self.countriesData.append(countries)
            }
        }
        let sortedList = self.countriesData.sorted {$0.caseDetail.totalConfirmed > $1.caseDetail.totalConfirmed }
        Singleton.sharedInstance.countryListData = sortedList
        
    }
}
