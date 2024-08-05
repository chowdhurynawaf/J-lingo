//
//  Constants.swift
//  j-lingo
//
//  Created by as on 6/12/24.
//

import Foundation
import UIKit


struct Constants{}

extension Constants{
    struct Screen {
        static let screenwidth = UIScreen.main.bounds.width
        static let screenheight = UIScreen.main.bounds.height
    }
    struct Colors {
        static let appcolor: UIColor = UIColor(hex: "#FB281C")!
        static let neogreen : UIColor = UIColor.systemGreen.withAlphaComponent(0.6)
    }
}
