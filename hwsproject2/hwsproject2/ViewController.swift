//
//  ViewController.swift
//  hwsproject2
//
//  Created by Enrique Florencio on 5/29/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var numOfQuestions = 0
    //Some code to check if it worked from this new laptop
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia" , "france", "germany", "ireland", "italy", "monaco",
        "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " Current Score: \(score)"
        numOfQuestions += 1
        if numOfQuestions == 11 {
            let ac = UIAlertController(title: "You have answered 10 questions", message: "Final Score: \(score) / 10", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            numOfQuestions = 0
            score = 0
        }
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())!"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

