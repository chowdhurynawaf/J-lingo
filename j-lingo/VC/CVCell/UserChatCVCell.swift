//
//  UserChatCVCell.swift
//  j-lingo
//
//  Created by as on 8/26/24.
//

import UIKit

class UserChatCVCell: UICollectionViewCell , NibLoadableView {

    @IBOutlet weak var parentHolderView: UIView!
    @IBOutlet weak var txtview: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        let targetSize = CGSize(width: contentView.frame.width, height: UIView.layoutFittingCompressedSize.height)
        let size = contentView.systemLayoutSizeFitting(targetSize,
                                                       withHorizontalFittingPriority: .required,
                                                       verticalFittingPriority: .fittingSizeLevel)
        return size
    }

}
