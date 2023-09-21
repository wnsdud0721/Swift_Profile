//
//  String.swift
//  Profile
//
//  Created by Junyoung_Hong on 2023/09/21.
//

import UIKit

// 취소선 생성 함수
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
