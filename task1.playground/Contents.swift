import UIKit

protocol ViewProtocol: AnyObject {
    func success()
    func failure(error: String)
}

class FirstViewController: ViewProtocol {
    
    func success() {
        print("SUCCESS")
    }
    
    func failure(error: String) {
        print(error)
    }
}

class SecondViewController: ViewProtocol {
    
    func success() {
        print("TRUE")
    }
    
    func failure(error: String) {
        print(error)
    }
}

class Presenter {
    weak var view: ViewProtocol?
    
    var bool = true
    
    required init(view: ViewProtocol) {
        self.view = view
    }
    
    func doSmth() {
        if bool {
            view?.success()
        } else {
            view?.failure(error: "FAIL")
        }
    }
}

var firstView = FirstViewController()
var secondView = SecondViewController()
var presenter = Presenter(view: firstView)

presenter.doSmth()
presenter.view = secondView
presenter.doSmth()
