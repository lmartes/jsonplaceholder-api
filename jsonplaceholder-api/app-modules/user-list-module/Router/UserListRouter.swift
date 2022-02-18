import Foundation
import UIKit

class UserListRouter: PresenterToRouterProtocol {
    static func createUserListModule(userListReference: UserListViewController) {
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = UserListPresenter()
        
        userListReference.presenter = presenter
        userListReference.presenter?.router = UserListRouter()
        userListReference.presenter?.view = userListReference
        userListReference.presenter?.interactor = UserListInteractor()
        userListReference.presenter?.interactor?.presenter = presenter
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: Storyboard.mainStoryboard, bundle: Bundle.main)
    }
    
    func pushToUserPost(with user: UserEntity, from view: UIViewController) {
        print("Push to user porst")
    }
    
}
