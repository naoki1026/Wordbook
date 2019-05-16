//
//  ViewController.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/09.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import RealmSwift

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var level : Results<Level>!
  let realm = try! Realm()
  var data = DataSet()
  let creationDate = Int(NSDate().timeIntervalSince1970)
  
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    level = realm.objects(Level.self)
    
    self.navigationController?.navigationBar.tintColor = .white
    
    tableView.dataSource = self
    tableView.delegate = self
    
    let userDefault = UserDefaults.standard
    let dict = ["firstLaunch": true]
    userDefault.register(defaults: dict)
    
    if userDefault.bool(forKey: "firstLaunch") {
      userDefault.set(false, forKey: "firstLaunch")
      initialData()
   
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.categories.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell {
      
     cell.configureCell(category: data.categories[indexPath.row])
      return cell
  }
    
    return UITableViewCell()
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
  
  //セルが選択された場合に発動する
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    try! realm.write {

      level[0].selectedLevel = data.categories[indexPath.row].level

    }
    
    performSegue(withIdentifier: "toSwipeCard", sender: self)
    
  }
}
