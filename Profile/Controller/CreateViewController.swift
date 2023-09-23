//
//  CreateViewController.swift
//  PetToDo
//
//  Created by Junyoung_Hong on 2023/08/24.
//

import UIKit
import SnapKit

class CreateViewController: UIViewController {
    
    private let createView = CreateView()
    
    var editingMemoText: String?
    var editingMemoIndex: Int?
    
    var isTextViewEdited = false
    var isEditingMode = false
    
    override func loadView() {
        view = createView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationControllerSet()
        navigationBarButtonAction()
        
        createView.createTextView.delegate = self
        navigationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBarButtonAction()
    }
    
    // 입력 종료
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.createView.createTextView.resignFirstResponder()
    }
}

private extension CreateViewController {
    
    func navigationControllerSet() {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.view.tintColor = UIColor(named: "MainColor")
    }
    
    func navigationBarButtonAction() {
        if isEditingMode {
            if let editingMemoText = editingMemoText {
                createView.createTextView.text = editingMemoText
                createView.createTextView.textColor = UIColor.black
            }
            // 네비게이션 바 오른쪽 버튼 커스텀 -> 완료
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(finishButtonTappedEdit))
        }
        else {
            DispatchQueue.main.async {
                self.createView.createTextView.text = "메모를 작성하세요."
                self.createView.createTextView.textColor = UIColor.lightGray
                self.createView.createTextView.resignFirstResponder()
            }
            // 네비게이션 바 오른쪽 버튼 커스텀 -> 완료
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(finishButtonTappedNew))
        }
    }
    
    // 새로운 메모 작성
    @objc func finishButtonTappedNew() {
        navigationController?.popViewController(animated: true)
        
//        if isTextViewEdited {
//            let newMemoText = createView.createTextView.text
//            
//            // 새 메모를 생성하고 memoArray에 추가
//            addNewMemo(newMemoText ?? "")
//        }
        if isTextViewEdited {
            let newMemoText = createView.createTextView.text
            
            addCoreNewMemo(newMemoText ?? "", false)
        }
    }
    
    // 메모 내용 수정
    @objc func finishButtonTappedEdit() {
        navigationController?.popViewController(animated: true)
        
        if let updatedMemo = createView.createTextView.text, !updatedMemo.isEmpty,
           let index = editingMemoIndex {
            
            // 해당 인덱스의 메모를 수정
            //editMemo(at: index, with: updatedMemo, isChecked: false)
            editCoreMemo(at: index, with: updatedMemo, isChecked: false)
            
            // 수정된 메모 내용을 업데이트하고 해당 셀만 리로드
            (self.navigationController?.viewControllers.first as? MainView)?.mainTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
        
        // 수정 모드 종료
        isEditingMode = false
    }
}

extension CreateViewController: UITextViewDelegate {
    
    // 초기 호출
    func textViewDidBeginEditing(_ textView: UITextView) {
        if createView.createTextView.textColor == UIColor.lightGray {
            createView.createTextView.text = nil
            createView.createTextView.textColor = UIColor.black
        }
    }
    
    // 입력 시 호출
    func textViewDidChange(_ textView: UITextView) {
        isTextViewEdited = !textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        //isTextViewEdited = !createTextView.text.isEmpty
    }
    
    // 입력 종료 시 호출
    func textViewDidEndEditing(_ textView: UITextView) {
        if createView.createTextView.text.isEmpty {
            createView.createTextView.text =  "메모를 작성하세요."
            createView.createTextView.textColor = UIColor.lightGray
        }
    }
}

extension CreateViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        isEditingMode = false
    }
}
