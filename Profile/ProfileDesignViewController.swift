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
    
    let imageNames = ["picture1", "picture2", "picture3", "picture4", "picture5", "picture6", "picture7", "picture1", "picture2", "picture3", "picture4", "picture5", "picture6", "picture7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        addSubView()
        addStackView()
        autoLayout()
        buttonAction()
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
    }
    
    // 제목
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "nabaecamp"
        label.textColor = UIColor.black
        label.font = UIFont.bold18
        return label
    }()
    
    // 프로필 이동 버튼
    private let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Menu"), for: .normal)
        return button
    }()
    
    // 사용자 프로필 사진
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.image = UIImage(named: "Profile")
        
        return imageView
    }()
    
    // post 수
    private let postCount: UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textColor = UIColor.black
        label.font = UIFont.bold16
        return label
    }()
    
    // post
    private let post: UILabel = {
        let label = UILabel()
        label.text = "post"
        label.textColor = UIColor.black
        label.font = UIFont.regular14
        return label
    }()
    
    // post 스택뷰
    private let postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // follower 수
    private let followerCount: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor.black
        label.font = UIFont.bold16
        return label
    }()
    
    // follower
    private let follower: UILabel = {
        let label = UILabel()
        label.text = "follower"
        label.textColor = UIColor.black
        label.font = UIFont.regular14
        return label
    }()
    
    // follower 스택뷰
    private let followerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // following 수
    private let followingCount: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor.black
        label.font = UIFont.bold16
        return label
    }()
    
    // following
    private let following: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.textColor = UIColor.black
        label.font = UIFont.regular14
        return label
    }()
    
    // following 스택뷰
    private let followingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // userfollowinfo 스택뷰
    private let userFollowInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // 사용자 이름
    private let userName: UILabel = {
        let label = UILabel()
        label.text = "르탄이"
        label.textColor = UIColor.black
        label.font = UIFont.bold14
        return label
    }()
    
    // 자기소개
    private let introduce: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer 🍎"
        label.textColor = UIColor.black
        label.font = UIFont.regular14
        return label
    }()
    
    // 주소
    private let link: UILabel = {
        let label = UILabel()
        label.text = "spartacodingclub.kr"
        label.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
        label.font = UIFont.regular14
        return label
    }()
    
    // Follow 버튼
    private let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.bold14
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
        button.layer.cornerRadius = 4
        return button
    }()
    
    // Message 버튼
    private let messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.bold14
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        return button
    }()
    
    // More 버튼
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "More"), for: .normal)
        button.snp.makeConstraints { make in
            make.width.equalTo(30)
        }
        return button
    }()
    
    // middleBar 스택뷰
    private let middleBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()
    
    // 구분선
    private let divideLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1)
        return view
    }()
    
    // gallery 버튼과 선 포함 View
    private let containerGallery: UIView = {
        let view = UIView()
        return view
    }()
    
    // gallery 버튼
    private let galleryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Grid"), for: .normal)
        return button
    }()
    
    // gallery 버튼 선
    private let galleryLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    private let galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Profile - Fill"), for: .normal)
        return button
    }()
}

// UI 관련 extension
extension ProfileDesignViewController {
    
    private func configureUI() {
        view.backgroundColor = UIColor.white
    }
    
    private func addSubView() {
        view.addSubview(titleLabel)
        view.addSubview(menuButton)
        view.addSubview(profileImageView)
        view.addSubview(userFollowInfoStackView)
        view.addSubview(userName)
        view.addSubview(introduce)
        view.addSubview(link)
        view.addSubview(middleBarStackView)
        view.addSubview(divideLine)
        view.addSubview(containerGallery)
        view.addSubview(galleryCollectionView)
        view.addSubview(profileButton)
        
        containerGallery.addSubview(galleryButton)
        containerGallery.addSubview(galleryLine)
    }
    
    private func addStackView() {
        
        postStackView.addArrangedSubview(postCount)
        postStackView.addArrangedSubview(post)
        
        followerStackView.addArrangedSubview(followerCount)
        followerStackView.addArrangedSubview(follower)
        
        followingStackView.addArrangedSubview(followingCount)
        followingStackView.addArrangedSubview(following)
        
        userFollowInfoStackView.addArrangedSubview(postStackView)
        userFollowInfoStackView.addArrangedSubview(followerStackView)
        userFollowInfoStackView.addArrangedSubview(followingStackView)
        
        middleBarStackView.addArrangedSubview(followButton)
        middleBarStackView.addArrangedSubview(messageButton)
        middleBarStackView.addArrangedSubview(moreButton)
        
        followButton.snp.makeConstraints { make in
            make.width.equalTo(messageButton.snp.width)
        }
    }
    
    private func autoLayout() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(14)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        menuButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-15)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.leading.equalTo(view.snp.leading).offset(14)
            make.width.height.equalTo(80)
        }
        
        userFollowInfoStackView.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(41)
            make.trailing.equalTo(view.snp.trailing).offset(-28)
            make.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(14)
            make.leading.equalTo(view.snp.leading).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(15)
        }
        
        introduce.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(2)
            make.leading.equalTo(view.snp.leading).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(15)
        }
        
        link.snp.makeConstraints { make in
            make.top.equalTo(introduce.snp.bottom)
            make.leading.equalTo(view.snp.leading).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(15)
        }
        
        middleBarStackView.snp.makeConstraints { make in
            make.top.equalTo(link.snp.bottom).offset(11)
            make.leading.equalTo(view.snp.leading).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(-15)
            make.height.equalTo(30)
        }
        
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(middleBarStackView.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(0.5)
        }
        
        containerGallery.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.width.equalTo(view.snp.width).dividedBy(3)
            make.height.equalTo(41)
        }
        
        galleryButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        galleryLine.snp.makeConstraints { make in
            make.top.equalTo(galleryButton.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        galleryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(containerGallery.snp.bottom).offset(2)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
        
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(galleryCollectionView.snp.bottom).offset(18)
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.width.equalTo(22.5)
            make.height.equalTo(22.75)
        }
    }
}

extension ProfileDesignViewController {
    
    private func buttonAction() {
        profileButton.addTarget(self, action: #selector(moveProfileVC), for: .touchUpInside)
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
struct ProfileDesignVC_Preview: PreviewProvider {
    static var previews: some View {
        ProfileDesignViewController().toPreview().edgesIgnoringSafeArea(.all)
    }
}
