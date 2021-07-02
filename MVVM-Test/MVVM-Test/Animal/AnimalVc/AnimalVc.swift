//
//  AnimalVc.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import UIKit

class AnimalVc: UIViewController {

    var animalModels: animalsModel!
    @IBOutlet weak var animalTbview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.initTableView()
        self.bindViewModel()
    }
    private func initTableView() {
        animalTbview.register(UINib(nibName: "animalCell", bundle: nil), forCellReuseIdentifier: "animalCell")
        animalTbview.delegate = self
        animalTbview.dataSource = self
    }
    private func bindViewModel() {
        animalModels = animalsModel()
    }
  
}
extension AnimalVc : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalModels.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell") as! animalCell
        cell.bindData(animal: animalModels.cellForRowAt(indexPath: indexPath))
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
