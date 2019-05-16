//
//  SwipeCardVC.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/10.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import RealmSwift
import ProgressHUD

class SwipeCardVC: UIViewController, WDFlashCardDelegate {

  let realm = try! Realm()
  var level = 0
  var flashcards : Results<FlashCards>!
  var selectedCardCount : Int = 0
  
  //カードをスワイプしている場合に１を算出
  var flipFlag = 0
  
  //カードが裏返している場合に１を算出
  var reverseFlag = 0
  
  //一覧画面に遷移する際に１
  var tapgestureFlag = 0
  
  var centerOfCard : CGPoint!
 

  @IBOutlet weak var basicCard: UIView!
  @IBOutlet weak var okImageView: UIImageView!
  @IBOutlet weak var ngImageView: UIImageView!
  
  @IBOutlet weak var flashCard: WDFlashCard!
  @IBOutlet weak var frontView: UIView!
  @IBOutlet weak var backView: UIView!
  @IBOutlet weak var englishText: UILabel!
  @IBOutlet weak var japaneseText: UILabel!
  
  @IBOutlet weak var subFlashCard: WDFlashCard!
  @IBOutlet weak var subBack: UIView!
  @IBOutlet weak var subFront: UIView!
  @IBOutlet weak var subEnglishText: UILabel!
  @IBOutlet weak var subJapaneseText: UILabel!
  
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var checkMeaning: UIButton!
  
  
  //MARK: Init
  override func viewDidLoad() {
    super.viewDidLoad()

    startButton.alpha = 0
    
    //初回のみ起動する
    let userDefault = UserDefaults.standard
    let dict = ["firstSwipeCardLaunch": true]
    userDefault.register(defaults: dict)

    if userDefault.bool(forKey: "firstSwipeCardLaunch") {
      userDefault.set(false, forKey: "firstSwipeCardLaunch")
     swipeCardExplanation()
    }
  
   level = realm.objects(Level.self)[0].selectedLevel
    
  
    self.navigationItem.title = "Level \(level)"
    self.navigationController?.navigationBar.titleTextAttributes
      = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 20)!]
    
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.init(red: 255/255, green: 49/255, blue: 81/255, alpha: 1)]
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "一覧", style: .done, target: self, action: #selector(addTapped))
    self.navigationController?.navigationBar.tintColor  = UIColor.init(red: 255/255, green: 49/255, blue: 81/255, alpha: 1)
    
    //ここでbasicカードとカードの動きが同じになるようになっている
    centerOfCard = basicCard.center
    
    flashCard.flashCardDelegate = self
    flashCard.duration = 0.5
    flashCard.flipAnimation = .flipFromLeft
    
    subFlashCard.flashCardDelegate = self
    subFlashCard.duration = 0.5
    subFlashCard.flipAnimation = .flipFromLeft
    
    
    backView.layer.cornerRadius = 10
    frontView.layer.cornerRadius = 10
    flashCard.layer.cornerRadius = 10
    
    subFlashCard.layer.cornerRadius = 10
    subBack.layer.cornerRadius = 10
    subFront.layer.cornerRadius = 10
    
    startButton.layer.cornerRadius = 5
    
    setFlashCards()
    
  }

override func viewWillDisappear(_ animated: Bool) {
    
    if reverseFlag == 1 {
      flashCard.flip()
      reverseFlag = 0
    }
    
     startButton.alpha = 1
    
  }
  
  //MARK: Handlers
  @objc func addTapped(){
    
   performSegue(withIdentifier: "toList", sender: self)
    
  }

  func resetCard(){
    
    basicCard.center = self.centerOfCard
    basicCard.transform = .identity
    
  }
  
  @IBAction func swipeCard(_ sender: UIPanGestureRecognizer) {
    
     if flashcards.count == 0 {
      
      ProgressHUD.showError("全てのカードの確認が完了しています")
      return
      
    }
    
    if tapgestureFlag  ==  1 { return }
    
    if reverseFlag == 1 {
      
      flashCard.flip()
      reverseFlag = 0
      
      return }
    
    setFlashCards()
    flipFlag = 0
    
    let card = sender.view!
    let point = sender.translation(in: view)
    
    sender.setTranslation(CGPoint.zero, in: view)
    card.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)
    
    flashCard.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)
    let xFromCenter = card.center.x - view.center.x

    if xFromCenter > 0 {
      
      okImageView.image = UIImage(named: "check_icon")
      okImageView.alpha = 1
      ngImageView.alpha = 0
 
    } else if xFromCenter < 0 {
      
      ngImageView.image = UIImage(named: "error_icon")
      ngImageView.alpha = 1
      okImageView.alpha = 0
      
    }
    
    if sender.state == UIGestureRecognizer.State.ended {
      if card.center.x < 75 {
        
        UIView.animate(withDuration: 0.2, animations: {
          
          self.resetCard()
          
          self.flashCard.center = CGPoint(x: self.flashCard.center.x - 600, y: self.flashCard.center.y)
          
            self.flipFlag = 1
          
        })
        
        selectedCardCount += 1
        okImageView.alpha = 0
        ngImageView.alpha = 0
        
        
        //全ての英単語の確認が終わった時に遷移する
        if selectedCardCount >= flashcards.count {
          
           performSegue(withIdentifier: "toList", sender: self)
          
        }
        
        return
        
      } else if card.center.x > self.view.frame.width - 75 {
        UIView.animate(withDuration: 0.2,  animations: {
          
          self.resetCard()
          self.flashCard.center = CGPoint(x: self.flashCard.center.x + 600, y: self.flashCard.center.y)
          self.flipFlag = 1
          
        })
        
        try! realm.write {
          
          flashcards[selectedCardCount].completion = true
          
        }
        
        ngImageView.alpha = 0
        okImageView.alpha = 0
        //全ての英単語の確認が終わった時に遷移する
        if selectedCardCount >= flashcards.count {
          
           performSegue(withIdentifier: "toList", sender: self)
          
        }

        return
        
      }
  
      UIView.animate(withDuration: 0.2, animations: {

        self.resetCard()
        self.flashCard.center = self.centerOfCard
        self.flashCard.transform = .identity
      
        
      })

      ngImageView.alpha = 0
      okImageView.alpha = 0
    }
  }
  
  @IBAction func newFlipPressed(_ sender: Any) {
    
 
    
    checkReverseFlag()
    checkMeaning.isEnabled = false
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
      
      self.checkMeaning.isEnabled = true

    }
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    tapgestureFlag = 1
    
    let listVC = ListVC()
    listVC.level = level
    
    if let listVC = segue.destination as? ListVC {
    listVC.level = level
    tapgestureFlag = 1
      
    }
  }
  
  //MARK: API
  
  func setFlashCards(){
    
    switch level {
      
    case 0 : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 0")
    case 1 : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 1")
    case 2 : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 2")
    case 3 : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 3")
    default : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 0")
    
    }
    
    if flashcards.count == 0 {
      
      englishText.text = "Finish"
      japaneseText.text = "おしまい"
      subEnglishText.text = "Finish"
      subJapaneseText.text = "おしまい"
      return
      
    }
    
    //配列を考慮してプラス２
    if (selectedCardCount + 2) > flashcards.count {
      
      subEnglishText.text = "Finish"
      subJapaneseText.text = "おしまい"
      
    } else {
      
      subEnglishText.text = flashcards[(selectedCardCount) + 1].english
      subJapaneseText.text = flashcards[(selectedCardCount) + 1].japanese1
      
    }

     englishText.text = flashcards[selectedCardCount].english
     japaneseText.text = flashcards[selectedCardCount].japanese1
    
   }
  
  @IBAction func pushStartButton(_ sender: Any) {
    
     startButton.alpha = 0
    
    selectedCardCount  = 0
    setFlashCards()
    tapgestureFlag = 0
    
    if flashcards.count != 0 {
    
    subEnglishText.text = flashcards[selectedCardCount].english
    subJapaneseText.text = flashcards[selectedCardCount].japanese1
      
    } else {
      
      ProgressHUD.showError("全てのカードの確認が完了しています")
      
    }
  }
  
  func restartCard(){
    
   if reverseFlag == 1 { flashCard.flip()}
    
    selectedCardCount  = 0
    setFlashCards()
    tapgestureFlag = 0
    subEnglishText.text = flashcards[selectedCardCount].english
    subJapaneseText.text = flashcards[selectedCardCount].japanese1
    
  }
  
  func swipeCardExplanation(){
    
    let vc = SwipeCardExplanation()
    
    //どのように画面に遷移するか
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .overCurrentContext
    present(vc, animated: true, completion: nil)
    
  }
  
  func checkReverseFlag(){
    
    if tapgestureFlag  ==  1 { return }
    
    if reverseFlag == 0{
      
      reverseFlag = 1
      
    } else {
      
      reverseFlag = 0
      
    }
    
    flashCard.flip()
    
  }
}

extension SwipeCardVC {
  
  func flipBackView(forFlashCard flashCardView: WDFlashCard) -> UIView {

    if flipFlag == 0 {

      return backView

    } else {

      return subBack

    }
  }
  
  func flipFrontView(forFlashCard flashCardView: WDFlashCard) -> UIView {

    
    if flipFlag == 0 {
      
      return frontView
      
    } else {
      
      return subFront
      
    }
  }
}

