//
//  UserData.swift
//  Profile
//
//  Created by Junyoung_Hong on 2023/09/15.
//

import UIKit

struct UserProfile: Codable {
    var userName: String
    var userAge: Int
}

struct MemoItems: Codable {
    var text: String = ""
    var isChecked: Bool = false
}

var memoItems = MemoItems()
var memoArray = [MemoItems]()

let defaults = UserDefaults.standard

let imageNames = ["picture1", "picture2", "picture3", "picture4", "picture5", "picture6", "picture7", "picture1", "picture2", "picture3", "picture4", "picture5", "picture6", "picture7"]
