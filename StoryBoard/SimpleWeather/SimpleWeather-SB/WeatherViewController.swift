//
//  WeatherViewController.swift
//  SimpleWeather-SB
//
//  Created by 이희승 on 2022/11/17.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var tempertureLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let cities = ["Seoul","Tokyo","LA","Seattle"]
    let weathers = ["cloud.fill","sun.max.fill","wind","cloud.sun.rain.fill"]
    
    @IBAction func changeButton(_ sender: Any) {
        
        cityLabel.text = cities.randomElement()
        
        let weather = weathers.randomElement()!
        weatherImageView.image = UIImage(systemName: weather)?.withRenderingMode(.alwaysOriginal)
        
        let randomTemp = Int.random(in: 10..<30)
        tempertureLabel.text = "\(randomTemp)°"
        
        
    }
    
    
    
    
    
    
    
    

}
