//
//  SingletonClass.swift
//  Covid19
//
//  Created by DonorRaja on 20/04/20.
//  Copyright © 2020 DonorRaja. All rights reserved.
//

import Foundation
import UIKit


class Singleton {
    static let sharedInstance = Singleton()
    private init(){}
    
    var globalCases = GlobalCasses()
    var countryListData = [CountryDetails]()
    
}
