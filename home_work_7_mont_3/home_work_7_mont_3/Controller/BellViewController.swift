//
//  ThirdViewController.swift
//  home_work_7_mont_3
//
//  Created by Аяз on 2/5/23.
//

import UIKit

class BellViewController: UIViewController {
    
    private var personalDataList: [PersonalData] = []
    
    private let searchBar = UISearchBar()

    private let tabelView = UITableView()
    
    private let tabelViewCell = UITableViewCell()
    
    private let mapLabel: UILabel = {
        let label = UILabel()
        label.text = "Or select via map?"
        label.textAlignment = .center
        label.textColor = .blue
        return label
    }()
       
    override func viewDidLoad() {
        super.viewDidLoad ()
        
        initUI()
        initData()
    }
    
    private func initUI(){
        //navigationItem.titleView = searchBar
        view.backgroundColor = .white
        searchBar.placeholder = "Поиск"
        
        view.addSubview(mapLabel)
        mapLabel.snp.makeConstraints{make in
            make.bottom.equalToSuperview().offset(19.5)
            make.leading.equalToSuperview().offset(130.5)
        }
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }

        view.addSubview(tabelView)
        tabelView.dataSource = self
        tabelView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(60.25)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview()
        }
        
        
    }
    
    private func initData() {
        personalDataList = [
            PersonalData(nameCompany: "ABC Company",
                         adreess: "Jl. Merah Biru Nomor 123"),
            PersonalData(nameCompany: "PQR Company",
                         adreess: "Jl. Merah Biru Nomor 456"),
            PersonalData(nameCompany: "XYZ Company",
                         adreess: "Jl. Merah Biru Nomor 789"),
            PersonalData(nameCompany: "ABCD Company",
                         adreess: "Jl. Merah Hijau Nomor 123"),
            PersonalData(nameCompany: "PQRS Company",
                         adreess: "Jl. Biru Kuning Nomor 123"),
            PersonalData(nameCompany: "WXYZ Company",
                         adreess: "Jl. Biru Hijau Nomor 123")
        ]
    }
}

extension BellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personalDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! BellTableViewCell
        cell.setData(name: personalDataList[indexPath.row].nameCompany,
                     adreess: personalDataList[indexPath.row].adreess)
        return cell
    }
    
    
}
