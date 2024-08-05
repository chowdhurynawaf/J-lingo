//
//  ViewController.swift
//  j-lingo
//
//  Created by as on 5/30/24.
//

import UIKit


final class SplashVC: UIViewController {
    
    
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var roundView: SphereView!
    @IBOutlet weak private var sunImageView: UIImageView!
    @IBOutlet weak private var roundViewCenterY: NSLayoutConstraint!
    @IBOutlet weak private var jLingoLbl: UILabel!
    @IBOutlet weak private var mountfujiView: MountFujiView!
    @IBOutlet weak private var fujiImageView: UIImageView!
    @IBOutlet weak private var fujiImageWidthCons: NSLayoutConstraint!
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.animateWholeView()
        self.move()
        
    }
    
    //MARK: - API
    
    
    //MARK: - Selectors
    
    //MARK: - helpers
    
    private func hideNav() {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func animateAppTitle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.jLingoLbl.isHidden = false
            self.mountfujiView.isHidden = false
            self.jLingoLbl.setAngle(-30.0)
            self.jLingoLbl.animateCursiveWriting(initialText: "J-Lingo", duration: 1.0){
                
                self.moveToLogin()
                
            }
        })
    }
    
    private func animateWholeView() {
        
        DispatchQueue.main.async {
            self.sunImageView.flip360(duration: 1.0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.sunImageView.animateToZeroSize()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.sunImageView.hideView()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2, execute: {
            self.roundView.fadeIn()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8, execute: {
            
            let safeConstant =   -((self.view.frame.height / 3))
            self.roundViewCenterY.constant = safeConstant
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveLinear, animations: {
                self.view.layoutIfNeeded()
                self.animateMountFuji()
                self.animateAppTitle()
            })
        })
    }
    
    private func moveToLogin(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            let vc = EmailLoginVC(nibName: "EmailLoginVC", bundle: nil)//OptionVC()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.present(vc, animated: true, completion: {
                
            })
            
        }
    }
    
    private func move() {
        let vc = EmailLoginVC(nibName: "EmailLoginVC", bundle: nil)//OptionVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func animateMountFuji() {
        self.mountfujiView.isHidden = false
        self.fujiImageView.isHidden = false
        
        UIView.animate(withDuration: 1.2) {
            self.fujiImageWidthCons.constant = Constants.Screen.screenwidth
            self.view.layoutIfNeeded()
        }
    }
}



