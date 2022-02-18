import Foundation
import UIKit

class UserPostRouter: PresenterToRouterUserPostProtocol {
    static func createUserPostModule(userPostReference: UserPostViewController, and user: UserEntity) {
        let presenter = UserPostPresenter()
        presenter.user = user
        userPostReference.presenter = presenter
        userPostReference.presenter?.router = UserPostRouter()
        userPostReference.presenter?.view = userPostReference
        userPostReference.presenter?.interactor = UserPostInteractor()
        userPostReference.presenter?.interactor?.presenter = presenter
    }
    
    func goBackToUserList(from view: UIViewController) {
        print("Go back!")
    }
    
    deinit {
        print("UserPostRouter removed")
    }
    
}
