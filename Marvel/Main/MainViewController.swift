//
//  MainViewController.swift
//  Marvel
//
//  Created by Ivan Valero on 25/03/2022.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    

    var rootPageViewController : RootPageViewController!
    
    @IBOutlet weak var tabsView: TabsView!
    
    private var options: [String] = ["Characters", "Events", "Log out"]
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        tabsView.buildView(delegate: self, options: options)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            destination.delegateRoot = self
            rootPageViewController = destination

            
        }
    }

}


extension MainViewController: RootPageProtocol {
    func currentPage(_ index: Int) {
        print("currentPage: ", index)
    }
    
    
}

extension MainViewController: TabsViewProtocol {
    func didSelectOption(index: Int) {
        print("index: ", index)
    }
}
