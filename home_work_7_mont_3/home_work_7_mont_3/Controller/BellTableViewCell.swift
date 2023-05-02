//
//  FourthTableViewCell.swift
//  home_work_7_mont_3
//
//  Created by Аяз on 2/5/23.
//

import UIKit

class BellTableViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderBottomWidth = 1
        view.layer.borderBottomColor = UIColor.lightGray.cgColor
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor.black
        return label
    }()
    
    private let adreessLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
            make.height.equalTo(68)
        }
        
        bgView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        bgView.addSubview(adreessLabel)
        adreessLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setData(name: String, adreess: String) {
        nameLabel.text = name
        adreessLabel.text = adreess
    }
}

extension CALayer {
    var borderBottomWidth: CGFloat {
        get { return self.borderWidth }
        set { self.setValue(newValue, forKey: "borderWidth") }
    }

    var borderBottomColor: CGColor? {
        get { return self.borderColor }
        set { self.setValue(newValue, forKey: "borderColor") }
    }
}
