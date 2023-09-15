//
//  ProfileView.swift
//  Profile
//
//  Created by Junyoung_Hong on 2023/09/15.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        addSubView()
        autoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) lazy var name: UILabel = {
        let label = UILabel()
        label.text = "르탄이"
        label.textColor = UIColor.black
        label.font = UIFont.bold14
        return label
    }()
    
    private(set) lazy var age: UILabel = {
        let label = UILabel()
        label.text = "26"
        label.textColor = UIColor.black
        label.font = UIFont.regular14
        return label
    }()
    
    private(set) lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.regular14
        return button
    }()
}

private extension ProfileView {
    
    func configureUI() {
        backgroundColor = UIColor.white
    }
    
    func addSubView() {
        addSubview(name)
        addSubview(age)
        addSubview(backButton)
    }
    
    func autoLayout() {
        name.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(32)
            make.centerX.equalTo(snp.centerX)
        }
        age.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(32)
            make.centerX.equalTo(snp.centerX)
        }
        backButton.snp.makeConstraints { make in
            make.top.equalTo(age.snp.bottom).offset(32)
            make.centerX.equalTo(snp.centerX)
        }
    }
}
