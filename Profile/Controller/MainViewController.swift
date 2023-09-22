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
        loadMemoItems()
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
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(moveProfileDesignVC))
        
        navigationItem.rightBarButtonItems = [ createButton, profileButton ]
    }
    
    // 메모 생성 페이지 이동
    @objc func moveCreateVC() {
        let createVC = CreateViewController()
        navigationController?.pushViewController(createVC, animated: true)
    }

    // 동물 사진 페이지 이동
    @objc func moveProfileDesignVC() {
        let profileDesignVC = ProfileDesignViewController()
        profileDesignVC.modalTransitionStyle = .coverVertical
        profileDesignVC.modalPresentationStyle = .fullScreen
        self.present(profileDesignVC, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    // TableView 줄 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    // TableView를 어떻게 보여줄 것인가
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainTableViewCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        // Cell 선택 시, 회색 배경 없애기
        mainTableViewCell.selectionStyle = .none
        
        mainTableViewCell.mainTableViewCellDelegate = self
        
        // 불러오기
        mainTableViewCell.memoLabel.text = memoArray[indexPath.row].text
        
        mainTableViewCell.indexPath = indexPath

        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        if memoArray[indexPath.row].isChecked == false {
            mainTableViewCell.checkButton.setImage(UIImage(systemName: "square", withConfiguration: imageConfig), for: .normal)
            mainTableViewCell.memoLabel.attributedText = NSAttributedString(string: mainTableViewCell.memoLabel.text ?? "")
        }
        
        else {
            mainTableViewCell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill", withConfiguration: imageConfig), for: .normal)
            mainTableViewCell.memoLabel.attributedText = mainTableViewCell.memoLabel.text?.strikeThrough()
        }
        
        return mainTableViewCell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteMemoAction = UIContextualAction(style: .normal, title: nil) {
            (action, view, completion) in
            
            // 삭제하기
            deleteMemo(at: indexPath.row) // 메모 삭제 함수 호출
            tableView.deleteRows(at: [indexPath], with: .automatic)
            loadMemoItems()
            completion(true)
        }
        
        deleteMemoAction.backgroundColor = .systemRed
        deleteMemoAction.image = UIImage(systemName: "trash.fill")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteMemoAction])
        
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
    }
    
    // Cell 선택하기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let createVC = CreateViewController()
        
        createVC.editingMemoText = memoArray[indexPath.row].text
        createVC.editingMemoIndex = indexPath.row
        
        createVC.isEditingMode = true

        navigationController?.pushViewController(createVC, animated: true)
    }
}

extension MainViewController: MainTableViewCellDelegate {
    func didTapCheckButton(in cell: MainTableViewCell) {
        if let indexPath = cell.indexPath {
            if memoArray[indexPath.row].isChecked == false {
                memoArray[indexPath.row].isChecked = true
            } else {
                memoArray[indexPath.row].isChecked = false
            }
        }
        
        saveMemoItems()
        loadMemoItems()
        mainView.mainTableView.reloadData()
    }
}
