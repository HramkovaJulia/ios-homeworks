//
//  SecondViewController.swift
//  PassDataProject
//
//  Created by Artyom Prima on 02.08.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var login: String!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let login = login else {return}
        nameLabel.text = "Hello \(String(login))"

    }
    @IBAction func buttonPress(_ sender: Any) {
       performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    

}
