//
//  NotificationCVCell.swift
//  j-lingo
//
//  Created by as on 8/12/24.
//

import UIKit

final class NotificationCVCell: UICollectionViewCell, NibLoadableView {

    
    @IBOutlet weak var parentHolderView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var notificationLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        
        imgView.image = UIImage()
        notificationLbl.text = ""
        dateLbl.text = ""
        
        super.prepareForReuse()
    }

}
