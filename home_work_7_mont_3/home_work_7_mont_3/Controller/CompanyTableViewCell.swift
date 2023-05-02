//
//  SecondViewController.swift
//  home_work_7_mont_3
//
//  Created by Аяз on 2/5/23.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {
    
    private let nameCompanyLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = Collor.mainBlue
        return label
    }()
    
    private let adreessLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        


        
        addSubview(nameCompanyLabel)
        nameCompanyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
        }
        
        addSubview(adreessLabel)
        adreessLabel.snp.makeConstraints { make in
            make.top.equalTo(nameCompanyLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(30)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(nameCompany: String, adreess: String) {
        nameCompanyLabel.text = nameCompany
        adreessLabel.text = adreess
    }
    
}
