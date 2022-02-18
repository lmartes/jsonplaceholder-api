import Foundation
import UIKit

protocol ViewToPresenterUserListProtocol: AnyObject {
    var view: PresenterToViewUserListProtocol? { get set }
    var interactor: PresenterToInteractorUserListProtocol? { get set }
    var router: PresenterToRouterUserListProtocol? { get set }
    func startFetchingUserList()
    func showUserPostView(with user: UserEntity, from view: UIViewController)
}

protocol PresenterToViewUserListProtocol: AnyObject {
    func showUserList(with users: [UserEntity])
    func showError(_ error: Error)
}

protocol PresenterToRouterUserListProtocol: AnyObject {
    static func createUserListModule(userListReference: UserListViewController)
    func pushToUserPost(with user: UserEntity, from view: UIViewController)
}

protocol PresenterToInteractorUserListProtocol: AnyObject {
    var presenter: InteractorToPresenterUserListProtocol? { get set }
    func fetchUserList()
}

protocol InteractorToPresenterUserListProtocol: AnyObject {
    func userListFetchedSuccess(userList: [UserEntity])
    func userListFetchFailed(with error: Error)
}
