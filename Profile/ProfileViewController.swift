//
//  ProfileViewController.swift
//  Profile
//
//  Created by Junyoung_Hong on 2023/09/13.
//

import UIKit
import SwiftUI
import SnapKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        addSubView()
        autoLayout()
    }
    
    private let name: UILabel = {
        let label = UILabel()
        label.text = "르탄이"
        label.textColor = UIColor.black
        label.font = UIFont.bold14
        return label
    }()
    
    private let age: UILabel = {
        let label = UILabel()
        label.text = "26"
        label.textColor = UIColor.black
        label.font = UIFont.regular14
        return label
    }()
}

extension ProfileViewController {
    
    private func configureUI() {
        view.backgroundColor = UIColor.white
    }
    
    private func addSubView() {
        view.addSubview(name)
        view.addSubview(age)
    }
    
    private func autoLayout() {
        name.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.centerX.equalTo(view.snp.centerX)
        }
        age.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(32)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}


// Preview를 위한 구조체
struct ProfileVC_Preview: PreviewProvider {
    static var previews: some View {
        ProfileViewController().toPreview()
    }
}
