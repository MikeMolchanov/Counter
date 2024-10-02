//
//  ViewController.swift
//  Counter
//
//  Created by Михаил on 11.08.2024.
//

import UIKit

class ViewController: UIViewController {
    var bookCounter: Int {
        get {
            return
            UserDefaults.standard.integer(forKey: "finalValue")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "finalValue")
        }
    }
    @IBAction func removeBook(_ sender: Any) {
        if bookCounter > 0 {
            bookCounter -= 1
            updateCounterLabel()
            let dateTimeString = dateAndTime()
            
            var oldHistoryText: String {
                get {
                    UserDefaults.standard.string(forKey: "history") ?? ""
                }
                set {
                    UserDefaults.standard.set(newValue, forKey: "history")
                }
            }
            let currentText = oldHistoryText + "\n" + history.text
            let newText = currentText + "\n" + dateTimeString + " значение изменено на -1"
            history.text = newText
            oldHistoryText = newText
            
            
        }
        else {
            let dateTimeString = dateAndTime()
            
            var oldHistoryText: String {
                get {
                    UserDefaults.standard.string(forKey: "history") ?? ""
                }
                set {
                    UserDefaults.standard.set(newValue, forKey: "history")
                }
            }
            let currentText = oldHistoryText + "\n" + history.text
            let newText = currentText + "\n" + dateTimeString + " попытка уменьшить значение счётчика ниже 0"
            history.text = newText
            oldHistoryText = newText
            
        }
        
    }
    @IBAction func addBook(_ sender: Any) {
        bookCounter += 1
        updateCounterLabel()
        let dateTimeString = dateAndTime()
        var oldHistoryText: String {
            get {
                UserDefaults.standard.string(forKey: "history") ?? ""
            }
            set {
                UserDefaults.standard.set(newValue, forKey: "history")
            }
        }
        let currentText = oldHistoryText + "\n" + history.text
        let newText = currentText + "\n" + dateTimeString + " значение изменено на +1"
        history.text = newText
        oldHistoryText = newText
        
    }
    @IBAction func reset(_ sender: Any) {
        bookCounter = 0
        updateCounterLabel()
        let dateTimeString = dateAndTime()
        var oldHistoryText: String {
            get {
                UserDefaults.standard.string(forKey: "history") ?? ""
            }
            set {
                UserDefaults.standard.set(newValue, forKey: "history")
            }
        }
        let currentText = oldHistoryText + "\n" + history.text
        let newText = currentText + "\n" + dateTimeString + " значение сброшено"
        history.text = newText
        oldHistoryText = newText
    }
   
    func dateAndTime()-> String {
        let dateTime = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        let dateTimeString = formatter.string(from: dateTime)
        return dateTimeString
    }
    func updateCounterLabel() {
        counter.text = "Значение счетчика: \(bookCounter)"
        }
    func updateHistory() {
        history.text = UserDefaults.standard.string(forKey: "history") ?? ""
    }
    
    @IBOutlet weak var counterButton: UIButton!
    @IBOutlet weak var history: UITextView!
    @IBOutlet weak var counter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let finalValue = bookCounter
        if finalValue == 0 {
            bookCounter = 0
        }
        updateCounterLabel()
        updateHistory()
    }
}
