//
//  MainTableViewCell.swift
//  PetToDo
//
//  Created by Junyoung_Hong on 2023/08/24.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Cell에 UILabel 추가
    let memoLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘 할 일"
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Cell에 UIButton 추가
    let checkButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        button.setImage(UIImage(systemName: "square", withConfiguration: imageConfig), for: .normal)
        button.tintColor = UIColor(named: "MainColor")
        button.configuration = UIButton.Configuration.plain()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Cell에서 ViewDidLoad()와 같은 기능, 직접 초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        autoLayout()
        
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 체크버튼 눌렀을 때, 실행되는 함수
    @objc func checkButtonTapped() {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        if checkButton.isSelected {
            checkButton.setImage(UIImage(systemName: "square", withConfiguration: imageConfig), for: .normal)
            checkButton.isSelected = false
            memoLabel.attributedText = NSAttributedString(string: memoLabel.text ?? "")
        }
        else {
            checkButton.setImage(UIImage(systemName: "checkmark.square.fill", withConfiguration: imageConfig), for: .normal)
            checkButton.isSelected = true
            memoLabel.attributedText = memoLabel.text?.strikeThrough()
        }
    }
    
    // TableView의 경우, contentView 사용
    private func addContentView() {
        contentView.addSubview(checkButton)
        contentView.addSubview(memoLabel)
    }
    
    // Cell 객체 autoLayout
    private func autoLayout() {
        
        // Snapkit을 이용한 경우
        checkButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(20)
        }
        
        memoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(checkButton.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
        }
    }

}
