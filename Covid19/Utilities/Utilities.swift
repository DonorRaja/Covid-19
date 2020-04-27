//
//  Utilities.swift
//  Covid19
//
//  Created by DonorRaja on 20/04/20.
//  Copyright © 2020 DonorRaja. All rights reserved.
//

import Foundation
import UIKit

class Utilities: NSObject {
    
    // Date Format Convertion
    public class func convertDateFormater(requestDate:String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let date = dateFormatter.date(from: requestDate)
        dateFormatter.dateFormat = "h:mm a, EEEE, MMM d, yyyy"
        let timeStamp = dateFormatter.string(from: date!)
        return timeStamp
        
    }
}
