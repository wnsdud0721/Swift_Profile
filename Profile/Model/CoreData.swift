//
//  CoreData.swift
//  Profile
//
//  Created by Junyoung_Hong on 2023/09/22.
//

import CoreData
import UIKit

// CoreData
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

var coreMemoItems = CoreDataTask(context: context)

var coreMemoArray = [CoreDataTask]()

// 메모 아이템 저장
func saveCoreMemoItems() {
    do {
        try context.save()
    } catch {
        print("Error saving context: \(error)")
    }
}

// 메모 아이템 불러오기
func loadCoreMemoItems() {
    let request: NSFetchRequest<CoreDataTask> = CoreDataTask.fetchRequest()
    do {
        coreMemoArray = try context.fetch(request)
    } catch {
        print("Error fetching data from context \(error)")
    }
}

// 메모 추가
func addCoreNewMemo(_ memoText: String, _ buttonChecked: Bool) {
    let newCoreMemo = CoreDataTask(context: context)
    newCoreMemo.text = memoText
    newCoreMemo.isChecked = buttonChecked
    coreMemoArray.append(newCoreMemo)
    saveCoreMemoItems()
}

// 메모 수정
func editCoreMemo(at index: Int, with newText: String, isChecked: Bool) {
    if index >= 0 && index < coreMemoArray.count {
        coreMemoArray[index].text = newText
        coreMemoArray[index].isChecked = isChecked
        saveCoreMemoItems()
    }
}

// 메모 삭제
func deleteCoreMemo(at index: Int) {
    if index >= 0 && index < coreMemoArray.count {
        context.delete(coreMemoArray[index])
        coreMemoArray.remove(at: index)
        saveCoreMemoItems() // 삭제 후 저장
    }
}
