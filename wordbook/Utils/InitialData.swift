//
//  initialData.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/10.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import RealmSwift

extension HomeVC {
  
  func initialData(){
    
    print(creationDate)
    print(Realm.Configuration.defaultConfiguration.fileURL)
    
    try! realm.write {
      
      let masterData =  [ FlashCards(value: ["cardId" : 1 , "english" : "about", "japanese1" : "副）〜くらい", "japanese2" : "前）〜について", "japanese3" : "", "category" : 0, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 2 , "english" : "across", "japanese1" : "前）〜の向こう側へ", "japanese2" : "", "japanese3" : "", "category" : 0, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 3 , "english" : "afraid", "japanese1" : "形）怖がって、恐れて", "japanese2" : "", "japanese3" : "", "category" : 0, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 4 , "english" : "after", "japanese1" : "副）後で", "japanese2" : "前）〜の後で", "japanese3" : "接）〜した後で", "category" : 0, "completion" : false, "lastUpdate" : creationDate]),
                          
                          FlashCards(value: ["cardId" : 5 , "english" : "again", "japanese1" : "副）もう一度、再び", "japanese2" : "", "japanese3" : "", "category" : 0, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 6 , "english" : "against", "japanese1" : "副）〜に反対して、〜に逆らって", "japanese2" : "", "japanese3" : "", "category" : 0, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 7 , "english" : "age", "japanese1" : "名）年齢", "japanese2" : "", "japanese3" : "", "category" : 0, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 8 , "english" : "ago", "japanese1" : "副）〜前に", "japanese2" : "", "japanese3" : "", "category" : 0, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 9 , "english" : "agree", "japanese1" : "動）意見が一致する、合意する", "japanese2" : "", "japanese3" : "", "category" : 0, "completion" : false, "lastUpdate" : creationDate]),
                          
                          FlashCards(value: ["cardId" : 1 , "english" : "adult", "japanese1" : "名）大人", "japanese2" : "", "japanese3" : "", "category" : 1, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 2 , "english" : "advise", "japanese1" : "動）〜に助言する", "japanese2" : "", "japanese3" : "", "category" : 1, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 3 , "english" : "anger", "japanese1" : "名）怒り", "japanese2" : "", "japanese3" : "", "category" : 1, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 4 , "english" : "announce", "japanese1" : "動）〜を発表する、公表する", "japanese2" : "", "japanese3" : "", "category" : 1, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 5 , "english" : "assist", "japanese1" : "動）〜を援助する", "japanese2" : "", "japanese3" : "", "category" : 1, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 6 , "english" : "attention", "japanese1" : "名）注意、注目", "japanese2" : "", "japanese3" : "", "category" : 1, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 7 , "english" : "autumn", "japanese1" : "名）秋", "japanese2" : "", "japanese3" : "", "category" : 1, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 8 , "english" : "balance", "japanese1" : "動）バランスを保つ", "japanese2" : "", "japanese3" : "", "category" : 1, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 9 , "english" : "baloon", "japanese1" : "名）風船、気球", "japanese2" : "", "japanese3" : "", "category" : 1, "completion" : false, "lastUpdate" : creationDate]),
                          
                          FlashCards(value: ["cardId" : 1 , "english" : "able", "japanese1" : "形）することができる", "japanese2" : "", "japanese3" : "", "category" : 2, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 2 , "english" : "above", "japanese1" : "副）上に", "japanese2" : "", "japanese3" : "", "category" : 2, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 3 , "english" : "accept", "japanese1" : "動）〜を受け入れる", "japanese2" : "", "japanese3" : "", "category" : 2, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 4 , "english" : "add", "japanese1" : "動）〜加える、追加する", "japanese2" : "", "japanese3" : "", "category" : 2, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 5 , "english" : "advertise", "japanese1" : "動）〜を宣伝する", "japanese2" : "", "japanese3" : "", "category" : 2, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 6 , "english" : "affect", "japanese1" : "動）〜に影響を及ぼす", "japanese2" : "", "japanese3" : "", "category" : 2, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 7 , "english" : "agriculture", "japanese1" : "名）農業", "japanese2" : "", "japanese3" : "", "category" : 2, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 8 , "english" : "although", "japanese1" : "接）〜にも関わらず", "japanese2" : "", "japanese3" : "", "category" : 2, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 9 , "english" : "apoligize", "japanese1" : "動）謝罪する", "japanese2" : "", "japanese3" : "", "category" : 2, "completion" : false, "lastUpdate" : creationDate]),
                          
                          FlashCards(value: ["cardId" : 1 , "english" : "admit", "japanese1" : "動）〜を認める", "japanese2" : "", "japanese3" : "", "category" : 3, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 2 , "english" : "aim", "japanese1" : "動）〜に狙いを定める", "japanese2" : "", "japanese3" : "", "category" : 3, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 3 , "english" : "amount", "japanese1" : "名）目標、目的", "japanese2" : "", "japanese3" : "", "category" : 3, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 4 , "english" : "appoint", "japanese1" : "名）量", "japanese2" : "", "japanese3" : "", "category" : 3, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 5 , "english" : "argue", "japanese1" : "動）〜を任命する", "japanese2" : "", "japanese3" : "", "category" : 3, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 6 , "english" : "attempt", "japanese1" : "動）主張する、反対する", "japanese2" : "", "japanese3" : "", "category" : 3, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 7 , "english" : "attend", "japanese1" : "動）〜を試みる", "japanese2" : "", "japanese3" : "", "category" : 3, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 8 , "english" : "awake", "japanese1" : "動）目が覚めた", "japanese2" : "", "japanese3" : "", "category" : 3, "completion" : false, "lastUpdate" : creationDate]),
                          FlashCards(value: ["cardId" : 9 , "english" : "ban", "japanese1" : "動）〜を禁止する", "japanese2" : "名）禁止令", "japanese3" : "", "category" : 3, "completion" : false, "lastUpdate" : creationDate]),
        
                          Level(value: ["selectedLevel" : 0 ])
                          
                          ]
      
      realm.add(masterData)
      
    }
  }
}

