//
//  ViewController.swift
//  TicTacToe
//
//  Created by Shweta Gupta on 16/10/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBAction func startGameButton(_ sender: Any) {
        let vc = TicTacToeView()
        self.navigationController?.pushViewController(UIHostingController(rootView: vc), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

