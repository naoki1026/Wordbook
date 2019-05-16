//
//  ListViewController.swift
//  wordbook
//
//  Created by Naoki Arakawa on 2019/04/10.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import RealmSwift

class ListVC: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate  {
  
  let idList: [String] = ["first", "second", "third"]
  var pageViewController: UIPageViewController!
  var viewControllers: [UIViewController] = []
  let underlineLayer = CALayer()
  var segmentItemWidth:CGFloat = 0
  var level = 0
  let realm = try! Realm()
  
  @IBOutlet weak var selectTab: UISegmentedControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
     level = realm.objects(Level.self)[0].selectedLevel
    

    selectTab.tintColor = UIColor.clear
    selectTab.backgroundColor = UIColor(red: 255/255, green: 49/255, blue: 81/255, alpha: 1)
    let attribute = [NSAttributedString.Key.foregroundColor:UIColor.white]
    selectTab.setTitleTextAttributes(attribute, for: .normal)
    segmentItemWidth = self.view.frame.width / 3
    underlineLayer.backgroundColor = UIColor.yellow.cgColor
    underlineLayer.frame = CGRect(x: 0, y: 26.5, width: self.view.frame.width / 3, height: 5)
    selectTab.layer.addSublayer(underlineLayer)
    
    self.navigationItem.title = "Level \(level)"
    self.navigationController?.navigationBar.titleTextAttributes
      = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 20)!]
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.init(red: 255/255, green: 49/255, blue: 81/255, alpha: 1)]
    
    for id in idList {
      viewControllers.append((storyboard?.instantiateViewController(withIdentifier: id))!)
      
    }
    
    pageViewController = children[0] as? UIPageViewController
    pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
    
    pageViewController.dataSource = self
    pageViewController.delegate = self
    
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    let index = idList.firstIndex(of: viewController.restorationIdentifier!)!
    
    if (index > 0) { return storyboard!.instantiateViewController(withIdentifier: idList[index - 1]) }
    
    return nil
    
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    let index = idList.firstIndex(of: viewController.restorationIdentifier!)!
    
    if (index < idList.count - 1) { return storyboard!.instantiateViewController(withIdentifier: idList[index + 1]) }
    
    return nil
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    
    let index = idList.firstIndex(of: (pageViewController.viewControllers?.first!.restorationIdentifier)!)
    self.selectTab.selectedSegmentIndex = index!
    
    guard let indexNumber = index  else { return }
    let x = CGFloat(indexNumber) * segmentItemWidth
    underlineLayer.frame.origin.x = x
    
  }
  
  @IBAction func selectedTab(_ sender: UISegmentedControl) {
    
    switch sender.selectedSegmentIndex {
      
    case 0: pageViewController.setViewControllers([viewControllers[0]], direction: .reverse, animated: true, completion: nil)
    
      break
      
    case 1: pageViewController.setViewControllers([viewControllers[1]], direction: .forward, animated: true, completion: nil)
      break
      
    case 2: pageViewController.setViewControllers([viewControllers[2]], direction: .forward, animated: true, completion: nil)
      break
      
    default: return
      
    }
    
    let x = CGFloat(selectTab.selectedSegmentIndex) * segmentItemWidth
    underlineLayer.frame.origin.x = x
    
  }
  
}
