//
//  ProfileDesignViewController.swift
//  Profile
//
//  Created by Junyoung_Hong on 2023/09/13.
//

import UIKit
import SwiftUI
import SnapKit

class ProfileDesignViewController: UIViewController {
    
    private let profileDesignView = ProfileDesignView()
    
    let imageNames = ["picture1", "picture2", "picture3", "picture4", "picture5", "picture6", "picture7", "picture1", "picture2", "picture3", "picture4", "picture5", "picture6", "picture7"]
    
    override func loadView() {
        view = profileDesignView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonAction()
        
        profileDesignView.postCount.text = String(imageNames.count)
        
        profileDesignView.galleryCollectionView.delegate = self
        profileDesignView.galleryCollectionView.dataSource = self
    }
}

extension ProfileDesignViewController {
    
    private func buttonAction() {
        profileDesignView.profileButton.addTarget(self, action: #selector(moveProfileVC), for: .touchUpInside)
    }
    
    @objc func moveProfileVC() {
        let profileVC = ProfileViewController()
        profileVC.modalTransitionStyle = .coverVertical
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
    }
}

extension ProfileDesignViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
        
        let imageName = imageNames[indexPath.item]
        if let image = UIImage(named: imageName) {
            cell.postImageView.image = image
        }
        return cell
    }
}

extension ProfileDesignViewController: UICollectionViewDelegateFlowLayout {
    
    // CollectionView Cell의 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 4)/3, height: (collectionView.bounds.width - 4)/3)
    }
    
    // 수평
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    // 수직
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

// Preview를 위한 구조체
//struct ProfileDesignVC_Preview: PreviewProvider {
//    static var previews: some View {
//        ProfileDesignViewController().toPreview().edgesIgnoringSafeArea(.all)
//    }
//}
