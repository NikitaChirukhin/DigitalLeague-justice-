import UIKit

protocol ViewProtocol: AnyObject {
    func success()
    func failure(error: String)
}

class ViewController: ViewProtocol {
    
    func success() {
        print("SUCCESS")
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

var view = ViewController()
var presenter = Presenter(view: view)

presenter.doSmth()

