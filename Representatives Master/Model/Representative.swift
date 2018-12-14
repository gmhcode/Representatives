//
//  Representative.swift
//  Representatives Master
//
//  Created by Greg Hughes on 12/13/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation
import Foundation

struct TopLevelDictionary: Decodable{
    
    let results : [Representative]
    
}
struct Representative: Decodable{
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
}
