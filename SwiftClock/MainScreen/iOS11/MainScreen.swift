//
//  MainScreen.swift
//  SwiftClock
//
//  Created by Angelos Staboulis on 4/1/20.
//  Copyright © 2020 Angelos Staboulis. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    var hours:UIImageView!
    var hoursAngle:CGFloat!
    var minuteAngle:CGFloat!
    var secondsAngle:CGFloat!
    @IBOutlet weak var face: UIImageView!
    @IBOutlet weak var imgHours: UIImageView!
    @IBOutlet weak var imgMinutes: UIImageView!
    @IBOutlet weak var imgSeconds: UIImageView!
    
    @objc func showClock(){
        let calendar = NSCalendar(calendarIdentifier: .gregorian)
        let component = calendar?.components(in: .current, from: .init())
        hoursAngle = CGFloat(Double(Double((component?.hour)!) / Double(12.0)) * Double.pi * 2.0)
        minuteAngle = CGFloat(Double(Double((component?.minute)!) / Double(60.0)) * Double.pi * 2.0)
        secondsAngle = CGFloat(Double(Double((component?.second)!) / Double(60.0)) * Double.pi * 2.0)
        imgHours.transform = CGAffineTransform(rotationAngle: hoursAngle)
        imgMinutes.transform = CGAffineTransform(rotationAngle: minuteAngle)
        imgSeconds.transform = CGAffineTransform(rotationAngle: secondsAngle)
        
       
    }
    func  setupView(){
         Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(showClock), userInfo: nil, repeats: true)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
