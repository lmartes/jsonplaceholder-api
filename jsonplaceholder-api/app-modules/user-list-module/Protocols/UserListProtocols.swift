import Foundation
import UIKit

protocol ViewToPresenterUserListProtocol {
    var view: PresenterToViewUserListProtocol? { get set }
    var interactor: PresenterToInteractorUserListProtocol? { get set }
    var router: PresenterToRouterUserListProtocol? { get set }
    func startFetchingUserList()
    func showUserPostView(with user: UserEntity, from view: UIViewController)
}

protocol PresenterToViewUserListProtocol {
    func showUserList(with users: [UserEntity])
    func showError(_ error: Error)
}

protocol PresenterToRouterUserListProtocol {
    static func createUserListModule(userListReference: UserListViewController)
    func pushToUserPost(with user: UserEntity, from view: UIViewController)
}

protocol PresenterToInteractorUserListProtocol {
    var presenter: InteractorToPresenterUserListProtocol? { get set }
    func fetchUserList()
}

protocol InteractorToPresenterUserListProtocol {
    func userListFetchedSuccess(userList: [UserEntity])
    func userListFetchFailed(with error: Error)
}
