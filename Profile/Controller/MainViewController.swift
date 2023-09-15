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
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonAction()
    }
}

// 버튼 관련 extension
private extension MainViewController {
    
    func buttonAction() {
        mainView.profileDesignButton.addTarget(self, action: #selector(moveProfileDesignVC), for: .touchUpInside)
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
