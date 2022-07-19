//
//  RootPageViewController.swift
//  Marvel
//
//  Created by Ivan Valero on 13/06/2022.
//

import UIKit

protocol RootPageProtocol: AnyObject {
    func currentPage(_ index: Int)
}

class RootPageViewController: UIPageViewController {

    var subViewControllers = [UIViewController]()
    var currentIndex : Int = 0
    weak var delegateRoot: RootPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        subViewControllers = [
            CharacterViewController(),
            EventsViewController(),
        ]
        
        _ = subViewControllers.enumerated().map({$0.element.view.tag = $0.offset})
        setViewControllerForIndex(index: 0, direction: .forward)
    }
    
    func setViewControllerForIndex(index: Int, direction: NavigationDirection, animated: Bool = true) {
        setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
    }
    

}

extension RootPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index : Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index <= 0 {
            return nil
        }
        return subViewControllers[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index : Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index >= (subViewControllers.count-1) {
            return nil
        }
        return subViewControllers[index+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let index = pageViewController.viewControllers?.first?.view.tag {
            currentIndex = index
            delegateRoot?.currentPage(index)
        }
    }
}
