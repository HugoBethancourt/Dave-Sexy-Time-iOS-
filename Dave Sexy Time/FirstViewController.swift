//
//  FirstViewController.swift
//  Dave Sexy Time
//
//  Created by Hugo Bethancourt on 1/25/18.
//  Copyright © 2018 Next Level Technology LLC. All rights reserved.
//
import UIKit
import ContactsUI
import FileProviderUI

class FirstViewController: UIViewController {
    
    
    @IBOutlet var taskTimeLabel: UILabel!
    @IBOutlet var projectTimeLabel: UILabel!
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var dailyLabel: UILabel!
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var addRowButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    @IBOutlet var logTable: UITableView!{
        didSet {
            logTable.dataSource = self
            logTable.delegate = self
        }
    }
    @IBOutlet var logTableCell: UITableViewCell!
    
    let date = Date()
    let dtm = DateFormatter()
    
    //var project = ["Date       Time       "]
    var project = [String]()
    //var task: String = ""
    
    var totalMonthly = 0
    var totalWeekly = 0
    var totalDaily = 0
    var seconds = 0
    var timer = Timer()
    var timerIsRunning = false
    var resumeTapped = false
    
    @objc func updateTime(){
        seconds += 1
        timerLabel.text = timeString(time : TimeInterval(seconds))
    }

    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(FirstViewController.updateTime)), userInfo: nil, repeats: true)
        timerIsRunning = true
    }
    
    func timeString(time : TimeInterval) -> String{
        let hours = UInt(time)/3600
        let minutes = UInt(time)/60 % 60
        let seconds = UInt(time) % 60
        if time <= 59{
            return String(format: "%02i", seconds)
        }
        if time <= 3599{
            return String(format: "%02i:%02i", minutes, seconds)
        }
        else {
            return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        }
}

    @IBAction func start(_ sender : UIButton){
        if timerIsRunning == false && !timer.isValid{ //start at 00:00:00
            runTimer()
            timerIsRunning = true
            self.startButton.setTitle("Stop", for : .normal)
            self.startButton.setTitleColor(UIColor.red, for: .normal)
            self.resetButton.isEnabled = false
            self.resetButton.isHidden = true
            self.addRowButton.isHidden = true
            self.addRowButton.isEnabled = false
        }
        else if timerIsRunning == true && !timer.isValid{ //resume from pause
            self.resetButton.isHidden = true
            timerIsRunning = true
            runTimer()
            self.startButton.isEnabled = true
            self.startButton.setTitle("Stop", for : .normal)
            self.startButton.setTitleColor(UIColor.red, for: .normal)
            self.resetButton.isEnabled = false
            self.addRowButton.isHidden = true
            self.addRowButton.isEnabled = false
        
        }
        else if timerIsRunning == true && timer.isValid{ //pause
            timerIsRunning = false
            timer.invalidate()
            self.startButton.isEnabled = true
            self.startButton.setTitle("Start", for : .normal)
            self.startButton.setTitleColor(UIColor.green, for: .normal)
            self.resetButton.isEnabled = true
            self.resetButton.isHidden = false
            self.addRowButton.isHidden = false
            self.addRowButton.isEnabled = true
        }
    }

    @IBAction func reset(_ sender : UIButton){
        seconds = 0
        timerLabel.text = timeString(time: TimeInterval(seconds))
        timer.invalidate()
        timerIsRunning = false
        self.startButton.isHidden = false
        self.startButton.isEnabled = true
        self.resetButton.isHidden = true
        self.startButton.setTitle("Start", for : .normal)
        self.startButton.setTitleColor(UIColor.green, for: .normal)
        //getDaily()
    }
    
    func getDaily(){
        totalDaily += seconds
        dailyLabel.text = timeString(time : TimeInterval(seconds))
    }

    @IBAction func addRow(_ sender : UIButton){
        dtm.dateFormat = "dd/MM/yyyy"
        let result = dtm.string(from: date)
        print(result)
        getDaily()
        dailyLabel.text = timeString(time: TimeInterval(totalDaily))
       //project.append("Date: \(result), Time: \(total)")
        project.append("")
        logTable.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: UITableViewRowAnimation.automatic)
        self.addRowButton.isHidden = true
        self.addRowButton.isEnabled = false
        self.startButton.isEnabled = false
        self.startButton.isHidden = true
        
    }


    override func viewDidLoad() {

        super.viewDidLoad()
        self.resetButton.isHidden = true
        self.addRowButton.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    //extension
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return project.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logTableCell0")! as UITableViewCell
        cell.textLabel!.text = project[indexPath.row]
        return  cell
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/
