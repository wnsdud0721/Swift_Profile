//
//  MainView.swift
//  Profile
//
//  Created by Junyoung_Hong on 2023/09/15.
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
    
    // Button 생성
    private(set) lazy var profileDesignButton: UIButton = {
       let button = UIButton()
        button.setTitle("ProfileDesginViewController", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.bold16
        return button
    }()
}

private extension MainView {
    
    func configureUI() {
        backgroundColor = UIColor.white
    }
    
    func addSubView() {
        addSubview(profileDesignButton)
    }
    
    func autoLayout() {
        profileDesignButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
