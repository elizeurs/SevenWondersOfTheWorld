//
//  DetailViewController.swift
//  SevenWondersOfTheWorld
//
//  Created by Elizeu RS on 23/08/19.
//  Copyright © 2019 elizeurs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var detailImageView: UIImageView!
  @IBOutlet weak var detailTitle: UILabel!
  @IBOutlet weak var detailFlag: UIImageView!
  @IBOutlet weak var detailDescription: UITextView!
  
  var sentData1: String!
  var sentData2: String!
  var sentData3: String!
  var sentData4: String!
  var sentData5: String!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
//      detail.sentData1 = item["Name"]
      
      
      self.navigationItem.title = sentData1
      
      detailImageView.image = UIImage(named: sentData2)
      detailTitle.text = sentData4
      detailFlag.image = UIImage(named: sentData3)
      detailDescription.text = sentData5
    }
  
//  hide "back" word from navigation controller
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.topItem?.title = ""
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
