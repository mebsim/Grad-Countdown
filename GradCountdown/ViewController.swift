import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    
    var timer = Timer()
    var time = 0
    
    @objc func updateTimer() {
        // Find a way to only call this once:
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let someDateTime = formatter.date(from: "2019/06/15 11:30")
        
        let timeNow = NSDate()
        
        weekLabel.text = "Weeks: " + String(describing: (someDateTime?.weeks(from: timeNow as Date))!)
        dayLabel.text = "Days: " + String(describing: ((someDateTime?.days(from: timeNow as Date))!)%7)
        hourLabel.text = "Hours: " + String(describing: ((someDateTime?.hours(from: timeNow as Date))!)%24)
        minuteLabel.text = "Minutes: " + String(describing: ((someDateTime?.minutes(from: timeNow as Date))!)%60)
        secondLabel.text = "Seconds: " + String(describing: ((someDateTime?.seconds(from: timeNow as Date))!)%60)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

// https://stackoverflow.com/a/27184261

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        var timeLeft = ""
        //if years(from: date)   > 0 { timeLeft = timeLeft + "\(years(from: date))y"   }
        //if months(from: date)  > 0 { timeLeft = timeLeft + "\(months(from: date)%12)M"  }
        if weeks(from: date)   > 0 { timeLeft = timeLeft + "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { timeLeft = timeLeft + "\(days(from: date)%7)d"    }
        if hours(from: date)   > 0 { timeLeft = timeLeft + "\(hours(from: date)%24)h"   }
        if minutes(from: date) > 0 { timeLeft = timeLeft + "\(minutes(from: date)%60)m" }
        if seconds(from: date) > 0 { timeLeft = timeLeft + "\(seconds(from: date)%60)s" }
        return timeLeft
    }
}
