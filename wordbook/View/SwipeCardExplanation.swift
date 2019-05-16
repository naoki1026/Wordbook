//
//  SwipeCardExplanation.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/05/15.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class SwipeCardExplanation: UIViewController {
  
  
  @IBOutlet weak var container: UIView!
  
  @IBOutlet weak var closeButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      container.layer.cornerRadius = 5
      closeButton.layer.cornerRadius = 5

      
    }

  @IBAction func tappedCloseButton(_ sender: Any) {
    
    self.dismiss(animated: true, completion: nil)
    
  }
  

}
