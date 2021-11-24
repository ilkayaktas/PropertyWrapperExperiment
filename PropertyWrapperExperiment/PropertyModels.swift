//
//  PropertyModels.swift
//  DependencyInjectionExperiment
//
//  Created by İlkay Aktaş on 23.11.2021.
//

import Foundation


struct ContactPoints {
    @Email
    var firstEmail : String?
    
    @Email
    var secondEmail : String? = "valid@test.com"
    
    @Email
    var thirdEmail: String? = "invalid"
    
    @Percent
    var percent = 90

    @Percent
    var percentOverflow = 190

    @Constrained(0...100)
    var scores: Int = 121
    
    @Capitalized
    var name = "my name"
}
