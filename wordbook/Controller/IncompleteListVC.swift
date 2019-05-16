//
//  FirstViewController.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/12.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//


import UIKit
import RealmSwift

class IncompleteListVC : UIViewController,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, incompleteListCellDelegate {
  
  //MARK: Properties
  lazy var realm = try! Realm()
  var flashcards : Results<FlashCards>!
  var result : Results<FlashCards>!
  var level : Int = 0
  var flashcard : Results<FlashCards>!
  var segment : Int = 0
  
  let underlineLayer = CALayer()
  var segmentItemWidth:CGFloat = 0
  
  @IBOutlet weak var collectionView: UICollectionView!
  private let refreshControl = UIRefreshControl()
  
  
  //MARK:Init
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    level = realm.objects(Level.self)[0].selectedLevel
    
    collectionView.register(UINib(nibName: "IncompleteListCell", bundle: nil), forCellWithReuseIdentifier: "incompleteCell")
    collectionView.delegate = self
    collectionView.dataSource = self
    
    extractFlashcards(withLevel: level, withSegment: segment)
    
    //UIRefreshControllのインスタンスを生成する。
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(handleRefresh), for: UIControl.Event.valueChanged)
    collectionView.addSubview(refreshControl)
    
    let userDefault = UserDefaults.standard
    let dict = ["firstincompleteListLaunch": true]
    userDefault.register(defaults: dict)
    
    if userDefault.bool(forKey: "firstincompleteListLaunch") {
      userDefault.set(false, forKey: "firstincompleteListLaunch")
    listExplanation()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {

    collectionView.reloadData()
  }
  
  
  @objc func handleRefresh(sender:AnyObject) {
    
    sender.beginRefreshing()
    collectionView.reloadData()
    sender.endRefreshing()
    
  }
  
  //MARK: Handlers
  
  func handleStarTapped(cell: IncompleteListCell) {
    
    let indexPath = self.collectionView.indexPath(for: cell)
    let flashCard = flashcards[indexPath!.item]
    try! realm.write {
      
      if flashCard.completion == true {
        
        flashCard.completion = false
        
      } else {
        
        flashCard.completion = true
        
      }
    }
    
    collectionView.reloadData()
    
  }
  
  
  func extractFlashcards(withLevel level : Int, withSegment segment : Int){
    
     switch level {
    
      case 0 : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 0")
      case 1 : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 1")
      case 2 : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 2")
      case 3 : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 3")
      default : flashcards = realm.objects(FlashCards.self).filter("completion = 0 && category = 0")
        
      }
    }
  
  func listExplanation(){
    
    let vc = ListExplanation()
    
    //どのように画面に遷移するか
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .overCurrentContext
    present(vc, animated: true, completion: nil)
    
  }
  
  
  }

extension IncompleteListVC : UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return flashcards.count
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "incompleteCell", for: indexPath) as? IncompleteListCell {
      
      cell.delegate = self
      cell.english.text = flashcards[indexPath.item].english
      cell.japanese1.text = flashcards[indexPath.item].japanese1
      cell.japanese2.text = flashcards[indexPath.item].japanese2
      cell.japanese3.text = flashcards[indexPath.item].japanese3
      
      return cell
      
    }
    
    return UICollectionViewCell()
    
  }
  
}
