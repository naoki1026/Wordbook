//
//  DataSet.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/09.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import Foundation

struct LevelCategory {
  
  let title : String
  let imageName : String
  let level : Int
  
}

class DataSet {
  
  //構造体が配列の中に入っている
  //イニシャライズ、初期化、使い始める状態
  let categories = [
    LevelCategory(title: "Level 0", imageName: "cebu-11", level: 0),
    LevelCategory(title: "Level 1", imageName: "cebu-7", level: 1),
    LevelCategory(title: "Level 2", imageName: "cebu-6", level: 2),
    LevelCategory(title: "Level 3", imageName: "cebu-3", level: 3)
]

}
