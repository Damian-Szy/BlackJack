//
//  HomeViewController.swift
//  CardGame
//
//  Created by Damian S on 2023-01-11.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var PlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlayButton.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    

    @IBAction func PlayButtonPressed(_ sender: UIButton) {
        let board = UIStoryboard(name: "Main", bundle: nil)
        let controller = board.instantiateViewController(withIdentifier: "BlackJackViewController")
        let navigation = UINavigationController(rootViewController: controller)
        self.view.addSubview(navigation.view)
        self.addChild(navigation)
        navigation.didMove(toParent: self)
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
