//
//  ViewController.swift
//  PassDataProject
//
//  Created by Artyom Prima on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passswordText: UITextField!
    @IBOutlet var textLabel: UIView!
    @IBOutlet weak var buttonLabel: UIButton!
    
    @IBOutlet weak var returnLabel: UILabel!
    

    @IBAction func buttonPress(_ sender: Any) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "UnwindSegue" else {return}
        guard let svc = segue.source as? SecondViewController else {return}
        self.returnLabel.text = svc.nameLabel.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvs = segue.destination as? SecondViewController else {return}
        dvs.login = loginText.text
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

