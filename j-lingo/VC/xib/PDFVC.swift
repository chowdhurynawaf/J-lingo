//
//  PDFVC.swift
//  j-lingo
//
//  Created by Macbook Pro on 10/11/24.
//

import UIKit
import PDFKit

final class PDFVC: UIViewController {
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var containerV: UIView!
    var pdfView : PDFView!
    var flag : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        loadPDFIntoView(pdfView: pdfView, pdfName: flag)
    }


    override func loadView() {
        if let nibView = Bundle.main.loadNibNamed("PDFVC", owner: self, options: nil)?.first as? UIView {
            self.view = nibView
        }
    }
    
    func setUp () {
        pdfView = PDFView(frame: self.view.bounds)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerV.addSubview(pdfView)
        
        backBtn.addTarget(self, action: #selector(popvc), for: .touchUpInside)
        self.headerLbl.text = self.setTitle()
    }
    
    func setTitle()->String {
        
        switch flag {
        case Constants.PDFFlags.hiragana:
            return "Hiragana"
            break;
        case Constants.PDFFlags.katakana:
            return "Katakana"
            break;
        case Constants.PDFFlags.kanji:
            return "Kanji"
            break;
        case Constants.PDFFlags.wx:
            return "Word Book X"
            break
        case Constants.PDFFlags.wy:
            return "Word Book Y"
            break
        case Constants.PDFFlags.wz:
            return "Word Book Z"
            break
        default:
            print("")
        }
        
        return ""
    }
    
    @objc func popvc() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // A function that loads a PDF document into a given PDFView
    func loadPDFIntoView(pdfView: PDFView, pdfName: String) {
        if let pdfURL = Bundle.main.url(forResource: pdfName, withExtension: "pdf") {
            if let pdfDocument = PDFDocument(url: pdfURL) {
                pdfView.document = pdfDocument
                pdfView.autoScales = true // Scale the PDF to fit the view
            } else {
                print("Failed to load PDF document.")
            }
        } else {
            print("PDF file not found.")
        }
    }
}
