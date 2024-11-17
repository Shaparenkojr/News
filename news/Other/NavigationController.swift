

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRootContoller()
    }
}

private extension NavigationController {
    
    func setupRootContoller() {
        let newsListController = NewsListViewController()
        viewControllers = [newsListController]
    }
}
