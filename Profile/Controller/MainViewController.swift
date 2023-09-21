//
//  ViewController.swift
//  PetToDo
//
//  Created by Junyoung_Hong on 2023/08/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationControllerSet()
        navigationBarButtonAction()
        
        mainView.mainTableView.rowHeight = 44
        
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.mainTableView.reloadData()
    }
}

private extension MainViewController {
    
    func navigationControllerSet() {
        
        // 네비게이션 LargeTitle 활성화 및 title 입력
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.view.tintColor = UIColor(named: "MainColor")
        navigationItem.title = "PetToDo"
    }
    
    func navigationBarButtonAction() {
        
        // 네비게이션 오른쪽 버튼 생성
        let createButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(moveCreateVC))
        
        let userButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(movePhotoVC))
        
        navigationItem.rightBarButtonItems = [ createButton, userButton ]
    }
    
    // 메모 생성 페이지 이동
    @objc func moveCreateVC() {
        let createVC = CreateViewController()
        navigationController?.pushViewController(createVC, animated: true)
    }

    // 동물 사진 페이지 이동
    @objc func movePhotoVC() {
        let profileDesignVC = ProfileDesignViewController()
        profileDesignVC.modalTransitionStyle = .coverVertical
        profileDesignVC.modalPresentationStyle = .fullScreen
        self.present(profileDesignVC, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Sections 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TableView 줄 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return savedMemos.count
        }
        return 0
    }
    
    // TableView를 어떻게 보여줄 것인가
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainTableViewCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        // Cell 선택 시, 회색 배경 없애기
        mainTableViewCell.selectionStyle = .none
        
        if indexPath.section == 0 {
            
            // 불러오기
            mainTableViewCell.memoLabel.text = savedMemos[indexPath.row]
            
            return mainTableViewCell
        }
        
        return mainTableViewCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "밥 주기"
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteMemo = UIContextualAction(style: .normal, title: nil) {
            (action, view, completion) in
            
            // 삭제하기
            savedMemos.remove(at: indexPath.row)
            UserDefaults.standard.set(savedMemos, forKey: "savedMemos")
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        deleteMemo.backgroundColor = .systemRed
        deleteMemo.image = UIImage(systemName: "trash.fill")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteMemo])
        
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
    }
    
    // Cell 선택하기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let createVC = CreateViewController()
        
        createVC.editingMemoText = savedMemos[indexPath.row]
        createVC.editingMemoIndex = indexPath.row
        
        createVC.isEditingMode = true

        navigationController?.pushViewController(createVC, animated: true)
    }


}

