//
//  DependencyInjectionExperimentApp.swift
//  DependencyInjectionExperiment
//
//  Created by İlkay Aktaş on 16.11.2021.
//

import SwiftUI

@main
struct DependencyInjectionExperimentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    
    
    init(){
        let contacts = ContactPoints()
        print("App started!")
        print(contacts.firstEmail ?? "yok")
        print(contacts.secondEmail ?? "yok")
        print(contacts.thirdEmail ?? "yok")
        print(contacts.percent)
        print(contacts.percentOverflow)
        print(contacts.scores)
        print(contacts.firstEmail == contacts.firstEmail)
        print(contacts.firstEmail == contacts.secondEmail)
        print(contacts.$percent.wrapper.wrappedValue)
        
        
    }
}
