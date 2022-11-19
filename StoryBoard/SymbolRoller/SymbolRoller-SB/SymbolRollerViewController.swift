//
//  SymbolRollerViewController.swift
//  SymbolRoller-SB
//
//  Created by 이희승 on 2022/11/17.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    
    let symbols: [String] = ["sun.min","moon","cloud","wind","snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // print("viewDidLoad")
        
        reload()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // print("viewDidAppear")
    }
    
    func reload()
    {
        let symbol = symbols.randomElement()!
        imageView.image = UIImage(systemName: symbol);
        label.text = symbol
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        // print("버튼 눌림")
        reload()
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
