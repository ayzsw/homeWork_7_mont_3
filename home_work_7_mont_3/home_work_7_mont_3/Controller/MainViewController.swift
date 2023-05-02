//
//  FirstViewController.swift
//  home_work_7_mont_3
//
//  Created by Аяз on 2/5/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var personalDataList: [PersonalData] = []
    
    private var filteredPersonalDataList: [PersonalData] = []
    
    private var isFiltering = false
    
    private let searchBar = UISearchBar()
    
    private let mapLabel: UILabel = {
        let label = UILabel()
        label.text = "Or select via map?"
        label.textAlignment = .center
        label.textColor = .blue
        return label
    }()
    
    private let tableView = UITableView()
    
    private let tableViewCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initData()
    }
    
    private func initUI(){
        navigationItem.titleView = searchBar
        view.backgroundColor = .white
        searchBar.placeholder = "Поиск"
        
        view.addSubview(tableView)
        searchBar.delegate = self
        tableView.dataSource = self
        
        tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(16)
        }
        
        view.addSubview(mapLabel)
        mapLabel.snp.makeConstraints{make in
            make.bottom.equalToSuperview().offset(19.5)
            make.leading.equalToSuperview().offset(130.5)
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

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredPersonalDataList.count : personalDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! CompanyTableViewCell
        cell.setData(nameCompany: isFiltering ? filteredPersonalDataList[indexPath.row].nameCompany
                     : personalDataList[indexPath.row].nameCompany,
                     adreess: isFiltering ? filteredPersonalDataList[indexPath.row].adreess
                     : personalDataList[indexPath.row].adreess)
        return cell
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltering = false
        } else {
            isFiltering = true
            filteredPersonalDataList = personalDataList.filter({$0.nameCompany.contains(searchText)})
        }
        tableView.reloadData()
    }
}
