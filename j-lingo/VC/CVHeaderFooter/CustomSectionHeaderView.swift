import UIKit
import SnapKit

final class CustomSectionHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "CustomSectionHeaderView"
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.init(name: Constants.Font.poppins_regular, size: 13)
        lbl.applyDropShadow()
        lbl.textColor = .black
        return lbl
    }()
    
    private let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("", for: .normal)
        btn.titleLabel?.font = UIFont.init(name: Constants.Font.poppins_regular, size: 15)
        btn.imageView?.image = UIImage.init(systemName: "arrow.right")
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(label)
        self.addSubview(button)
        
        label.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(20)
        }
        
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // Configure method to set the label text and button visibility
    func configure(labelText: String, isButtonHidden: Bool) {
        label.text = labelText
        button.isHidden = isButtonHidden
    }
}

