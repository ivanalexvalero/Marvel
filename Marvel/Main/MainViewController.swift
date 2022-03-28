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
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()


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
