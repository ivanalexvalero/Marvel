//
//  MainViewController.swift
//  Marvel
//
//  Created by Ivan Valero on 13/06/2022.
//

import UIKit
import SwiftUI
import FirebaseAuth


//struct OptionsModel {
//    let title: String
//    let image: UIImage
//}

class MainViewController: UIViewController {

   
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var buttonsView: Buttons!
    
    var rootPageViewController : RootPageViewController!
    var currentPageIndex: Int = 0 {
        willSet{
            print("WilSet: \(currentPageIndex)")
            let cell = buttonsView.collectionView.cellForItem(at: IndexPath(item: currentPageIndex, section: 0))
            cell?.isSelected = false
        }
        didSet {
            print("DidSet: \(currentPageIndex)")
            if let _ = rootPageViewController{
                rootPageViewController.currentIndex = currentPageIndex
                let cell = buttonsView.collectionView.cellForItem(at: IndexPath(item: currentPageIndex, section: 0))
                cell?.isSelected = true
            }
        }
    }
    
    
//    var options2: [OptionsModel] = []
    
    private var options: [buttonsModel] = [.init(name: "Character", image1: UIImage(systemName: "circle.hexagongrid") ?? UIImage()),.init(name: "Events", image1: UIImage(systemName: "calendar") ?? UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonsView.buildView(delegate: self, options: options)
        
        title = "Marvel Challenge"
        logoutButton.layer.cornerRadius = 15
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "login")
//            let vc = LoginViewController()
//            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
            
            
        }catch{
            // error
            print(error)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            destination.delegateRoot = self
            rootPageViewController = destination
        }
    }
}

extension MainViewController : RootPageProtocol {
    func currentPage(_ index: Int) {
        print("currentPage: ", index)
        currentPageIndex = index
        buttonsView.selectedItem = IndexPath(item: index, section: 0)
    }
}


extension MainViewController: ButtonsProtocol {
    func didSelectOption(index: Int) {
        print("index buttons:", index)
        
        var direction: UIPageViewController.NavigationDirection = .forward

        if index < currentPageIndex {
            direction = .reverse
        }
        rootPageViewController.setViewControllerForIndex(index: index, direction: direction)
     
        currentPageIndex = index
        
    }
}

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "")
//        navigationBar.topItem?.backBarButtonItem?.tintColor = UIColor(.black)
    }
}
