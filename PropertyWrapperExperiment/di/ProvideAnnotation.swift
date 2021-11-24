//
//  ProviderAnnotation.swift
//  guvercin_base
//
//  Created by Adil ÇETİN on 11.11.2021.
//

import Foundation

@propertyWrapper struct Provide<T> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        DependencyInjector.register(dependency: wrappedValue)
    }
}
