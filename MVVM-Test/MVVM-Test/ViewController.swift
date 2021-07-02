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
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "GithubViewcontroller") as! GithubViewcontroller
//        self.navigationController?.pushViewController(vc, animated: true)
//        self.navigationController!.pushViewController(ViewController(nibName: "GithubViewcontroller", bundle: nil), animated: true)
//        let githubViewController = GithubViewcontroller(nibName: "GithubViewController", bundle: nil)
//        let githubViewController = GithubViewcontroller.init(nibName: "GithubViewController", bundle: nil)
//        self.navigationController?.pushViewController(githubViewController, animated: true)
        let githubViewController = GithubViewcontroller.initFromNib()
//        self.present(githubViewController, animated: true)
        self.navigationController?.pushViewController(githubViewController, animated: true)
    }
}

