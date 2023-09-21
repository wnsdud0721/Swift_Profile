//
//  CreateView.swift
//  PetToDo
//
//  Created by Junyoung_Hong on 2023/09/05.
//

import Foundation
import UIKit
import SnapKit

class CreateView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        addSubView()
        autoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TextView 생성
    private(set) lazy var createTextView: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = UIColor.white
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 17)
        return textView
    }()
}

private extension CreateView {
    
    func configureUI() {
        backgroundColor = UIColor.white
    }
    
    func addSubView() {
        addSubview(createTextView)
    }
    
    func autoLayout() {
        createTextView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
        }
    }
}
