//
//  GithubViewcontroller.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import UIKit

class GithubViewcontroller: UIViewController {
    private var viewModel: GithubViewModel!
    @IBOutlet weak var searchtext: UITextField!
    @IBOutlet weak var githubTbview: UITableView!
    @IBOutlet weak var topactivities: UIActivityIndicatorView!
    @IBOutlet weak var bottomactivities: UIActivityIndicatorView!
    private var currentLanguage = ""
    private var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableView()
        self.bindViewModel()
        
    }
    private func initTableView() {
        searchtext.delegate = self
        githubTbview.register(UINib(nibName: "githubTableViewCell", bundle: nil), forCellReuseIdentifier: "githubTableViewCell")
        githubTbview.delegate = self
        githubTbview.dataSource = self
        githubTbview.tableFooterView = UIView()
        self.topactivities.isHidden = true
        self.bottomactivities.isHidden = true
    }
    private func bindViewModel() {
        viewModel = GithubViewModel()
        viewModel.needReloadTableView = { [weak self] in
            self?.githubTbview.reloadData()
            self?.topactivities.stopAnimating()
            self?.topactivities.isHidden = true
        }

        viewModel.needShowError = { [weak self] error in
            self?.showError(error: error)
            self?.topactivities.stopAnimating()
            self?.topactivities.isHidden = true
        }

        viewModel.needSetStateBottomIndicatorView = { [weak self] show in
            self?.bottomactivities.isHidden = !show
            if show {
                self?.bottomactivities.startAnimating()

            } else {
                self?.bottomactivities.stopAnimating()
            }
        }
    }
    private func showError(error: BaseError) {
        let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    private func performSearch() {
        // Not search with same string
        guard let language = searchtext.text?.trimmingCharacters(in: .whitespaces),
            language != currentLanguage else {
            return
        }
        // Clear text then clear table view
        if language.isEmpty {
            viewModel.clearTableView()
            return
        }

        // Request API here
        viewModel.requestRepositories(language: language)
        self.topactivities.isHidden = false
        self.topactivities.startAnimating()
        currentLanguage = language
    }
}
extension GithubViewcontroller : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "githubTableViewCell") as! githubTableViewCell
        cell.bindData(data: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension UIViewController {
    static func initFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}
extension GithubViewcontroller: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] timer in
            // search after 0.5 second
            self?.performSearch()
        })
        
        return true
    }
    
    // Clear text with button
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        viewModel.clearTableView()
        return true
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
