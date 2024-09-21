//
//  Helper.swift
//  j-lingo
//
//  Created by as on 8/7/24.
//

import UIKit
import SnapKit



struct Helper{}

extension Helper {
    
   static func combineDictionaries<Key: Hashable, Value>(_ dictionaries: [Key: Value]...) -> [Key: Value] {
        var combinedDictionary = [Key: Value]()
        
        for dictionary in dictionaries {
            for (key, value) in dictionary {
                combinedDictionary[key] = value
            }
        }
        
        return combinedDictionary
    }
    
  
    
   static func createLabeledView(withText text: String) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let label = UILabel()
        label.text = text
        label.font = UIFont.init(name: Constants.Font.poppins_regular, size: 15)
        view.addSubview(label)
        label.applyDropShadow()
       
        
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
       
       
        return view
    }
    
}



