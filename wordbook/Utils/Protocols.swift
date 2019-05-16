//
//  Protocols.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/10.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import Foundation

//Protocol
protocol CompleteListCellDelegate {
  
  func handleStarTapped(cell: CompleteListCell)
  
}

protocol incompleteListCellDelegate {
  
  func handleStarTapped(cell: IncompleteListCell)
  
}
