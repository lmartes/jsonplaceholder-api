import Foundation
import UIKit

class UserListPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingUserList() {
        interactor?.fetchUserList()
    }
    
    func showUserPostView(with user: UserEntity, from view: UIViewController) {
        router?.pushToUserPost(with: user, from: view)
    }
    
}

extension UserListPresenter: InteractorToPresenterProtocol {
    func userListFetchedSuccess(userList: [UserEntity]) {
        view?.showUserList(with: userList)
    }
    
    func userListFetchFailed(with error: Error) {
        view?.showError(error)
    }
    
}
