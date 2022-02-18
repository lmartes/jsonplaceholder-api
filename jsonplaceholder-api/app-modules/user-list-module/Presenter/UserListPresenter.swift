import Foundation
import UIKit

class UserListPresenter: ViewToPresenterUserListProtocol {
    var view: PresenterToViewUserListProtocol?
    var interactor: PresenterToInteractorUserListProtocol?
    var router: PresenterToRouterUserListProtocol?
    
    func startFetchingUserList() {
        interactor?.fetchUserList()
    }
    
    func showUserPostView(with user: UserEntity, from view: UIViewController) {
        router?.pushToUserPost(with: user, from: view)
    }
    
}

extension UserListPresenter: InteractorToPresenterUserListProtocol {
    func userListFetchedSuccess(userList: [UserEntity]) {
        view?.showUserList(with: userList)
    }
    
    func userListFetchFailed(with error: Error) {
        view?.showError(error)
    }
    
}
