//
//  UserDataManager.swift
//  Profile
//
//  Created by Junyoung_Hong on 2023/09/21.
//

import UIKit

// 메모 아이템 저장
func saveMemoItems() {
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(memoArray)
        defaults.set(data, forKey: "savedMemos")
    } catch {
        print("Error encoding memo items: \(error)")
    }
}

// 메모 아이템 불러오기
func loadMemoItems() {
    do {
        if let savedData = defaults.data(forKey: "savedMemos") {
            let decoder = JSONDecoder()
            let data = try decoder.decode([MemoItems].self, from: savedData)
            print(data)
            memoArray = data
        }
    } catch {
        print("Error encoding memo items: \(error)")
    }
}

// 메모 추가
func addNewMemo(_ memoText: String) {
    var newMemo = MemoItems()
    newMemo.text = memoText
    memoArray.append(newMemo)
    saveMemoItems()
}

// 메모 수정
func editMemo(at index: Int, with newText: String, isChecked: Bool) {
    if index >= 0 && index < memoArray.count {
        memoArray[index].text = newText
        memoArray[index].isChecked = isChecked
        saveMemoItems()
    }
}

// 메모 삭제
func deleteMemo(at index: Int) {
    if index >= 0 && index < memoArray.count {
        memoArray.remove(at: index)
        saveMemoItems() // 삭제 후 저장
    }
}
