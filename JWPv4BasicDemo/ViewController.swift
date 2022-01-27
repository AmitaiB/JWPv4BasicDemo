//
//  ViewController.swift
//  JWPv4BasicDemo
//
//  Created by Amitai Blickstein on 1/13/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setupAndPresentPlayer(_ sender: Any) {
        let pvc = CustomPlayerViewController()
        pvc.edgesForExtendedLayout = []
        navigationController?.pushViewController(pvc, animated: true)
    }
}

