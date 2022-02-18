import Foundation
import UIKit

protocol ViewToPresenterProtocol {
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func startFetchingUserList()
    func showUserPostView(with user: UserEntity, from view: UIViewController)
}

protocol PresenterToViewProtocol {
    func showUserList(with users: [UserEntity])
    func showError(_ error: Error)
}

protocol PresenterToRouterProtocol {
    static func createUserListModule(userListReference: UserListViewController)
    func pushToUserPost(with user: UserEntity, from view: UIViewController)
}

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchUserList()
}

protocol InteractorToPresenterProtocol {
    func userListFetchedSuccess(userList: [UserEntity])
    func userListFetchFailed(with error: Error)
}
