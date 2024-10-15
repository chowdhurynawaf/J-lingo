//
//  MessageListCVCell.swift
//  j-lingo
//
//  Created by as on 8/14/24.
//

import UIKit
import Lottie

final class MessageListCVCell: UICollectionViewCell, NibLoadableView {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var messagelbl: UILabel!
    @IBOutlet var lottieImg: LottieAnimationView!
    @IBOutlet weak var activeView: CustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

}
