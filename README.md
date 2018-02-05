# MVP-Swift-Templates
__MVP (Model View Presenter)__ generator which consists of:
* `View` 

```swift
class LoginViewController: UIViewController {
    
    // MARK: Outlets
    
    
    // MARK: Injections
    var presenter: LoginPresenterInput!
    var configurator: LoginConfigurable!

    // MARK: View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator = LoginConfigurator()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
    }

}

// MARK: - LoginPresenterOutput
extension LoginViewController: LoginPresenterOutput {

}

```

* `Presenter`
```swift
protocol LoginPresenterInput {
    
    var router: LoginRoutable { get }
    func viewDidLoad()
    
}

protocol LoginPresenterOutput: class {
    
}

class LoginPresenter:  LoginPresenterInput {
    
    //MARK: Injections
    private weak var output: LoginPresenterOutput?
    var router: LoginRoutable
    
    //MARK: LifeCycle 
    init(output: LoginPresenterOutput,
         router: LoginRoutable) {
        
        self.output = output
        self.router = router
    }
    
    //MARK: LoginPresenterInput
    func viewDidLoad() {
        
    }
}
```

* `Configurator`
```swift
protocol LoginConfigurable {
    func configure(viewController: LoginViewController)
}

class LoginConfigurator: LoginConfigurable {

    //MARK: LoginConfigurable
    func configure(viewController: LoginViewController) {
    
        let router = LoginRouter(viewController: viewController)
        
        let presenter = LoginPresenter(
            output: viewController,
            router: router
        )
        
        viewController.presenter = presenter

    }
}
```

* `Router`
```swift
protocol LoginRoutable {
    
}

class LoginRouter: LoginRoutable {
    
    //MARK: Injections
    private weak var viewController: LoginViewController?
    
    //MARK: LifeCycle
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    //MARK: LoginRoutable

}
```

# Installation

To install MVP Swift Xcode templates, run:
```
make install
```
To uninstall MVP Swift Xcode templates, run:
```
make uninstall
```
