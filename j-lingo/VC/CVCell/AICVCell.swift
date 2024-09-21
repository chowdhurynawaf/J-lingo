//
//  AICVCell.swift
//  j-lingo
//
//  Created by as on 8/26/24.
//

import UIKit

class AICVCell: UICollectionViewCell, NibLoadableView {
    
    @IBOutlet weak var txtview: UITextView!
    @IBOutlet weak var parentHolderView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtview.font = UIFont.init(name: Constants.Font.poppins_regular, size: 13)
    }

    
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        let targetSize = CGSize(width: contentView.frame.width, height: UIView.layoutFittingCompressedSize.height)
        let size = contentView.systemLayoutSizeFitting(targetSize,
                                                       withHorizontalFittingPriority: .required,
                                                       verticalFittingPriority: .fittingSizeLevel)
        return size
    }
}
