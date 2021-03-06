import Foundation

class UserPostPresenter: ViewToPresenterUserPostProtocol {
    var view: PresenterToViewUserPostProtocol?
    var interactor: PresenterToInteractorUserPostProtocol?
    var router: PresenterToRouterUserPostProtocol?
    var user: UserEntity?
    
    func startFetchingUserPost() {
        guard let user = user else {
            return
        }
        interactor?.fetchUserPost(with: user)
    }
    
}

extension UserPostPresenter: InteractorToPresenterUserPostProtocol {
    func userPostFetchedSuccess(userPosts: [PostEntity]) {
        guard let user = user else {
            return
        }
        view?.showUserPost(with: userPosts, userData: user)
    }
    
    func userPostFetchFailed(with error: Error) {
        view?.showError(error)
    }
    
}
