//
//  ViewController.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btnGotoanimalvc(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AnimalVc") as! AnimalVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnGotorestponseList(_ sender: Any) {
        let githubViewController = GithubViewcontroller.initFromNib()
        self.navigationController?.pushViewController(githubViewController, animated: true)
    }
}

