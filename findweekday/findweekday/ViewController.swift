//
//  ViewController.swift
//  findweekday
//
//  Created by Artyom Prima on 31.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func findDay(_ sender: UIButton) {
        let calendarType = Calendar.current
        var dateComponents = DateComponents()
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {return}
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        guard let date = calendarType.date(from: dateComponents) else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        let weekDay = dateFormatter.string(from: date)
        let capitalizedWeekday = weekDay.capitalized
        resultLabel.text = capitalizedWeekday
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

