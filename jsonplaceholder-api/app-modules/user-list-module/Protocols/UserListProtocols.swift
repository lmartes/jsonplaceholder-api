import Foundation
import UIKit

protocol ViewToPresenterProtocol {
    var view: PresenterToViewProtocol { get set }
    var interactor: PresenterToInteractorProtocol { get set }
    var router: PresenterToRouterProtocol { get set }
    func startFetchingUserList()
    func showUserPostView(with user: UserEntity, from view: UIViewController)
}

protocol PresenterToViewProtocol {
    func showUserList(users: [UserEntity])
    func showError()
}

protocol PresenterToRouterProtocol {
    //static func createUserPostModule(userListReference: UserListViewController)
    static func createUserListModule() -> UserListViewController
    func pushToUserPost(posts: [String], from view: UIViewController)
}

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol { get set }
    func fetchUserList()
}

protocol InteractorToPresenterProtocol {
    func userListFetchedSuccess(userList: [UserEntity])
    func userListFetchFailed()
}
