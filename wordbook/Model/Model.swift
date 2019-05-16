//
//  Model.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/10.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import Foundation
import RealmSwift

class FlashCards : Object {
  
  @objc dynamic var cardId = 0
  @objc dynamic var english = ""
  @objc dynamic var japanese1 = ""
  @objc dynamic var japanese2 = ""
  @objc dynamic var japanese3 = ""
  @objc dynamic var category = 0
  @objc dynamic var completion : Bool = false
  @objc dynamic var lastUpdate : Int = 0
  
  //  override class func primaryKey() -> String? {
  //    return "english"
  //
  //  }
}

class Level : Object {
  
  @objc dynamic var selectedLevel = 0

}
