//
//  ChangVC.swift
//  j-lingo
//
//  Created by as on 8/5/24.
//

import UIKit
import Lottie
import SDWebImage

class ChangVC: UIViewController {
    
    
    @IBOutlet weak var changImgView: SDAnimatedImageView!
    @IBOutlet weak var loaderView: LottieAnimationView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        showLoader()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        showChang()
    }
    
    private func showChang() {
       
        changImgView.center = self.view.center
        
        if let gifPath = Bundle.main.path(forResource: "chang", ofType: "gif"),
           let gifData = try? Data(contentsOf: URL(fileURLWithPath: gifPath)) {
            let animatedImage = SDAnimatedImage(data: gifData)
            changImgView.image = animatedImage
        }
    }
    
    fileprivate func showLoader() {
        
        loaderView.loopMode = .loop
        loaderView.contentMode = .scaleAspectFit
        loaderView.play()
    }
}
