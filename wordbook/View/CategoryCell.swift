//
//  CategoryCell.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/09.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
  
  
  @IBOutlet weak var lvTitle: UILabel!
  @IBOutlet weak var backView: UIView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      
     backView.layer.cornerRadius = 10
    
    }

      func configureCell(category: LevelCategory) {
    
        lvTitle.text = category.title
          
      }
    }
  
