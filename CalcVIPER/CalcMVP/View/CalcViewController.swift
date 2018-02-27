//
//  ViewController.swift
//  CalcMVP
//
//  Created by BLVCK on 25/02/2018.
//  Copyright © 2018 BLVCK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CalcView {
    
    var presenter: CalcViewOutput!
 
    @IBOutlet weak var resultLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        presenter.digitPressed(with: sender.currentTitle!, and: resultLabel.text!)
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        presenter.resetPressed()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        presenter.calculatePressed(with: sender.currentTitle!, and: resultLabel.text!)
    }
    
    @IBAction func signPressed(_ sender: UIButton) {
        presenter.signPressed(with: sender.currentTitle!, and: resultLabel.text!)
    }
    
    
    func setDigits(digit: String) {
        resultLabel.text = digit
    }
    
    func showAlert(with message: String) {
        
        let alert = UIAlertController(title: "Ошибка!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }


}

