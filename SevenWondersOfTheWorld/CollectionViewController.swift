//
//  CollectionViewController.swift
//  SevenWondersOfTheWorld
//
//  Created by Elizeu RS on 23/08/19.
//  Copyright © 2019 elizeurs. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var items = [[String:String]]()
  
  func loadPlist() -> [[String:String]] {
    
    let path = Bundle.main.path(forResource: "WondersOfTheWorld", ofType: "plist")
    return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
  }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
      
      self.navigationItem.title = "Seven Wonders of the World"
      
      self.items = loadPlist()
    }

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

      if segue.identifier == "showDetail" {
        
        let detail = segue.destination as! DetailViewController
        
        if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
          
          let item = self.items[indexPath.row]
          
          detail.sentData1 = item["Name"]
          detail.sentData2 = item["Image"]
          detail.sentData3 = item["Flag"]
          detail.sentData4 = item["Country"]
          detail.sentData5 = item["Description"]
        }
      }
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
    
        // Configure the cell
      
      let item = self.items[indexPath.row]
      
      cell.cellImageView.image = UIImage(named: item["Image"]!)
    
        return cell
    }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var widthCell = 0
    var heightCell = 0
    
//    iPhone x, 6, 7, 8
    if screenSize.width == 375 {
      widthCell = 172
      heightCell = 125
    }
    
    //    iPhone 6+, 7+, 8+
    if screenSize.width == 414 {
      widthCell = 191
      heightCell = 125
    }
    
    //    every other iPhone
    if screenSize.width == 320 {
      widthCell = 144
      heightCell = 125
    }
    
    return CGSize(width: widthCell, height: heightCell)
    
  }
  
}
