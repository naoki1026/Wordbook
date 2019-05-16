//
//  FullListCell.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/05/15.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class FullListCell: UICollectionViewCell {
  
  @IBOutlet weak var view: RoundedShadowView!
  @IBOutlet weak var english: UILabel!
  @IBOutlet weak var japanese1: UILabel!
  @IBOutlet weak var japanese2: UILabel!
  @IBOutlet weak var japanese3: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
}

