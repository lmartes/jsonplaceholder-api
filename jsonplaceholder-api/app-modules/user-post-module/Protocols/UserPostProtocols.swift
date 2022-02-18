import Foundation
import UIKit

protocol ViewToPresenterUserPostProtocol: AnyObject {
    var view: PresenterToViewUserPostProtocol? { get set }
    var interactor: PresenterToInteractorUserPostProtocol? { get set }
    var router: PresenterToRouterUserPostProtocol? { get set }
    func startFetchingUserPost()
}

protocol PresenterToViewUserPostProtocol: AnyObject {
    func showUserPost(with posts: [PostEntity])
    func showError(_ error: Error)
}

protocol PresenterToRouterUserPostProtocol: AnyObject {
    static func createUserPostModule(userPostReference: UserPostViewController, and user: UserEntity)
    func goBackToUserList(from view: UIViewController)
}

protocol PresenterToInteractorUserPostProtocol: AnyObject {
    var presenter: InteractorToPresenterUserPostProtocol? { get set }
    func fetchUserPost(with user: UserEntity)
}

protocol InteractorToPresenterUserPostProtocol: AnyObject {
    func userPostFetchedSuccess(userPosts: [PostEntity])
    func userPostFetchFailed(with error: Error)
}
