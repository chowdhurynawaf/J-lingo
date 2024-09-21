//
//  ChangLoadingView.swift
//  j-lingo
//
//  Created by as on 8/4/24.
//

import UIKit
import Lottie
import SDWebImage

final class ChangLoadingView : UIView {

    @IBOutlet weak var changImgView : SDAnimatedImageView!
    @IBOutlet weak var loader : LottieAnimationView!
    
    // Load the view from the XIB file
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         commonInit()
     }
     
     override init(frame: CGRect) {
         super.init(frame: frame)
         commonInit()
     }
     
     private func commonInit() {
         let nib = UINib(nibName: "ChangLoadingView", bundle: nil)
         let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
         view.frame = self.bounds
         addSubview(view)
     }

    
}
