//
//  InversionOfControl.swift
//  DependencyInjectionExperiment
//
//  Created by İlkay Aktaş on 23.11.2021.
//

import Foundation

@propertyWrapper
struct Email<T : StringProtocol> {
    var value : T?
    
    var wrappedValue: T? {
            get {
                return validate(email: value) ? value : nil
            }
            set {
                value = newValue
            }
        }
    
    init(wrappedValue value: T?) {
        self.value = value
    }
    
    private func validate(email: T?) -> Bool {
            guard let email = email else { return false }
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
    
}

extension Email: Equatable {
    static func ==(lhs: Email, rhs: Email) -> Bool {
     return lhs.wrappedValue?.lowercased() == rhs.wrappedValue?.lowercased()
    }
}

@propertyWrapper
struct Percent {
    private let minValue = 0
    private let maxValue = 100
    private var value: Int
    
    init(wrappedValue value: Int) {
        self.value = value
    }
    var wrappedValue: Int {
        get {
            return max(min(value, maxValue), minValue)
        }
        set {
            value = newValue
        }
    }
    
    // Projected value
    var projectedValue: SomeProjection {
            return SomeProjection(wrapper: self)
        }
    
}

struct SomeProjection {
    var wrapper: Percent
}

@propertyWrapper
struct Constrained<T: Comparable> {
    private var range: ClosedRange<T>
    private var value: T
    init(wrappedValue value: T, _ range: ClosedRange<T>) {
        self.value = value
        self.range = range
    }
    var wrappedValue: T {
        get {
            return max(min(value, range.upperBound), range.lowerBound)
        }
        set {
            value = newValue
        }
    }
}

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}
