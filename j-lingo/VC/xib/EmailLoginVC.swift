//
//  EmailLoginVC.swift
//  j-lingo
//
//  Created by as on 7/31/24.
//

import UIKit
import Lottie
import Hero
import SDWebImage



final class EmailLoginVC: UIViewController {
    
    @IBOutlet weak private var parentView: UIView!
    @IBOutlet weak private var redWaveView: LottieAnimationView!
    @IBOutlet weak private var upperLeftWaveImgView: UIView!
    @IBOutlet weak private var credentialHolderView: UIView!
    @IBOutlet weak private var toplogin: UILabel!
    @IBOutlet weak private var LoginBtnHolderView: UIView!
    @IBOutlet weak private var loginBtn: MHSoftUIButton!
    @IBOutlet weak private var eyeView: LottieAnimationView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var showPassBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideNav()
        self.showRedWaveAnimation()
        self.showeyeAnimation()
        tappedOnForgotPassword(self)
        
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        credentialHolderView.addNeumorphicEffect()
        loginBtn.addSoftUIEffectForButton(cornerRadius: 8, themeColor: Constants.Colors.appcolor)
        self.animateLoginLbl()
        
    }
    
    deinit {
        
        self.redWaveView.stop()
        self.eyeView.stop()
        
    }
    
    private func hideNav() {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    private func showRedWaveAnimation() {
        self.redWaveView.loopMode = .autoReverse
        self.redWaveView.contentMode = .scaleToFill
        self.redWaveView.play()
        
    }
    
    private func showeyeAnimation() {
        self.eyeView.loopMode = .autoReverse
        self.eyeView.contentMode = .scaleToFill
        self.eyeView.play()
    }
    
    private func animateLoginLbl  () {
       
            self.toplogin.zoomIn(duration: 2.0) { _ in
            
        }
    }
    
    private func showChangView() {
        
        let vc = ChangVC(nibName: "ChangVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
        self.showChangView()
    }
    
    
    @IBAction func eyeBtnTapped(_ sender: Any) {
        
        
    }
    
    
    @IBAction func tappedOnForgotPassword(_ sender: Any) {
        
        let vc = ForgotPasswordVC(nibName: "ForgotPasswordVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}


