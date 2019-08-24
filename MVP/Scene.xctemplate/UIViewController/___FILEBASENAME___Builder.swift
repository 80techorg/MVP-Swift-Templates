//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct ___VARIABLE_sceneName___Builder {
    
    static func viewController() -> ___VARIABLE_sceneName___ViewController {
        
        let storyboard = UIStoryboard(storyboard: .<#storyboardName#>)
        let viewController: ___VARIABLE_sceneName___ViewController = storyboard.instantiateViewController()
        let configurator = ___VARIABLE_sceneName___Configurator()
        configurator.configure(viewController: viewController)

        return viewController
    }
}
