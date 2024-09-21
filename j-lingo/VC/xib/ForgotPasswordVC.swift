//
//  ForgotPasswordVC.swift
//  j-lingo
//
//  Created by as on 8/5/24.
//

import UIKit

class ForgotPasswordVC : UIViewController {
    
    
    @IBOutlet weak var emailTFView: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var sendBtn: MHSoftUIButton!
    @IBOutlet weak var otpView: UIView!
    @IBOutlet weak var submitbtn: MHSoftUIButton!
    @IBOutlet weak var submitbtnView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        self.setBtnColor()
        self.hideOtpView()
        
    }
    
    
    
    @IBAction func tappedSubmitBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func sendBtnTapped(_ sender: Any) {
        
        ToastHelper.showToast(imageName: "paperPlane", titleStr: "Otp Sent!", subtitleStr: "Please check your email..")
        self.hideEmailView()
        self.showOtpView()
    }
    
    private func hideEmailView() {
        
        self.sendBtnView.isHidden = true
        self.emailTFView.isHidden = true
    }
    
    private func showOtpView() {
        
        self.otpView.isHidden = false
        self.submitbtnView.isHidden = false
    }
    
    private func hideOtpView() {
        
        self.otpView.isHidden = true
        self.submitbtnView.isHidden = true
    }
    
    private func setBtnColor() {
        
        
        self.submitbtn.addSoftUIEffectForButton(cornerRadius: 10, themeColor: Constants.Colors.appcolor)
        self.sendBtn.addSoftUIEffectForButton(cornerRadius: 10, themeColor: Constants.Colors.appcolor)
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
