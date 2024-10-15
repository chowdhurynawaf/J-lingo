//
//  UserDefaultsHelper.swift
//  j-lingo
//
//  Created by Macbook Pro on 10/14/24.
//

import UIKit

class UserDefaultsHelper {

    private let stringKey = "savedString"
    private let arrayKey = "stringArray"

    // Function to save a string to UserDefaults
    func saveString(data: String) {
        UserDefaults.standard.set(data, forKey: stringKey)
    }

    // Function to retrieve a string from UserDefaults
    func retrieveString() -> String? {
        return UserDefaults.standard.string(forKey: stringKey)
    }

    // Function to append a tuple of strings to an array in UserDefaults
    func appendToArray(tuple: (String, String)) {
        var array = retrieveArray()
        array.append(tuple)
        // Convert to [[String]] to store in UserDefaults
        let storedArray = array.map { [$0.0, $0.1] }
        UserDefaults.standard.set(storedArray, forKey: arrayKey)
    }

    // Function to retrieve the array of tuples from UserDefaults
    func retrieveArray() -> [(String, String)] {
        guard let storedArray = UserDefaults.standard.array(forKey: arrayKey) as? [[String]] else {
            return []
        }
        return storedArray.compactMap { tuple in
            guard tuple.count == 2,
                  let first = tuple[0] as? String,
                  let second = tuple[1] as? String else {
                return nil
            }
            return (first, second)
        }
    }
}
