//
//  MylearningFooter.swift
//  j-lingo
//
//  Created by as on 8/12/24.
//

import UIKit

final class CustomFooterView: UICollectionReusableView {
    static let reuseIdentifier = "CustomFooterView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
