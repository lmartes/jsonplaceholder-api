import Foundation
import UIKit

class UserListRouter: PresenterToRouterUserListProtocol {
    static func createUserListModule(userListReference: UserListViewController) {
        let presenter: ViewToPresenterUserListProtocol & InteractorToPresenterUserListProtocol = UserListPresenter()
        userListReference.presenter = presenter
        userListReference.presenter?.router = UserListRouter()
        userListReference.presenter?.view = userListReference
        userListReference.presenter?.interactor = UserListInteractor()
        userListReference.presenter?.interactor?.presenter = presenter
    }
    
    func pushToUserPost(with user: UserEntity, from view: UIViewController) {
        guard let UserPostViewController = view.storyboard?.instantiateViewController(withIdentifier: Identifier.userPostViewController) as? UserPostViewController else {
            return
        }
        UserPostRouter.createUserPostModule(userPostReference: UserPostViewController, and: user)
        view.navigationController?.pushViewController(UserPostViewController, animated: true)
    }
    
}
