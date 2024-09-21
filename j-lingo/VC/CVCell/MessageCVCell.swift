//
//  MessageCVCell.swift
//  j-lingo
//
//  Created by as on 8/15/24.
//

import UIKit

final class MessageCVCell: UICollectionViewCell , NibLoadableView {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var p2textView: UITextView!
    @IBOutlet weak var p1textView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
