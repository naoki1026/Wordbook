//
//  ListCell.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/10.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class CompleteListCell: UICollectionViewCell {
  
  var delegate : CompleteListCellDelegate?
  
  @IBOutlet weak var view: RoundedShadowView!
  @IBOutlet weak var english: UILabel!
  @IBOutlet weak var japanese1: UILabel!
  @IBOutlet weak var cellButton: UIButton!
  @IBOutlet weak var japanese2: UILabel!
  @IBOutlet weak var japanese3: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    cellButton.tintColor = .red
    
}
  
  @IBAction func buttonTapped(_ sender: Any) {
    
    delegate?.handleStarTapped(cell: self)
    
  }
  
  
  
}
