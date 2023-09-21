//
//  MainView.swift
//  PetToDo
//
//  Created by Junyoung_Hong on 2023/09/05.
//

import Foundation
import UIKit
import SnapKit
    
class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        addSubView()
        autoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TableView 만들기
    private(set) lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        
        // 왼쪽 공백 없애기
        tableView.separatorInset.left = 0
        return tableView
    }()
}

private extension MainView {
    
    func configureUI() {
        backgroundColor = UIColor.white
    }
    
    func addSubView() {
        addSubview(mainTableView)
    }
    
    func autoLayout() {
        mainTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.bottom.equalTo(snp.bottom)
        }
    }
}
