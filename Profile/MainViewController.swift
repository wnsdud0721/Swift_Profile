//
//  MainViewController.swift
//  Profile
//
//  Created by Junyoung_Hong on 2023/09/13.
//

import UIKit
import SwiftUI
import SnapKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        addSubView()
        autoLayout()
        buttonAction()
    }
    
    // Button 생성
    private let profileDesignBtn: UIButton = {
       let button = UIButton()
        button.setTitle("ProfileDesginViewController", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .bold16
        return button
    }()
}

// UI 관련 extension
extension MainViewController {
    
    private func configureUI() {
        view.backgroundColor = UIColor.white
    }
    
    private func addSubView() {
        view.addSubview(profileDesignBtn)
    }
    
    private func autoLayout() {
        profileDesignBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
}

// 버튼 관련 extension
extension MainViewController {
    
    private func buttonAction() {
        profileDesignBtn.addTarget(self, action: #selector(moveProfileDesignVC), for: .touchUpInside)
    }
    
    @objc func moveProfileDesignVC() {
        let profileDesignVC = ProfileDesignViewController()
        profileDesignVC.modalTransitionStyle = .coverVertical
        profileDesignVC.modalPresentationStyle = .fullScreen
        self.present(profileDesignVC, animated: true, completion: nil)
    }
}

// Preview를 위한 구조체
//struct MainVC_Preview: PreviewProvider {
//    static var previews: some View {
//        MainViewController().toPreview()
//    }
//}
