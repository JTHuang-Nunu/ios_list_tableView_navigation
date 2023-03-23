//
//  SubViewController.swift
//  hw2_list
//
//  Created by mac03 on 2023/3/22.
//

import UIKit

class SubViewController: UIViewController {
    var name: String = ""
    var image: String = ""
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        imageView?.image = UIImage(named: image)
//        init?(Coder: NSCoder, contac)
        // Do any additional setup after loading the view.
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
