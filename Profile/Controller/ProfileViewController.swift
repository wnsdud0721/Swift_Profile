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
    
    private let profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonAction()
    }
}

private extension ProfileViewController {
    
    func buttonAction() {
        profileView.backButton.addTarget(self, action: #selector(moveBack), for: .touchUpInside)
    }
    
    @objc func moveBack() {
        self.dismiss(animated: true)
    }
}

// Preview를 위한 구조체
//struct ProfileVC_Preview: PreviewProvider {
//    static var previews: some View {
//        ProfileViewController().toPreview()
//    }
//}
