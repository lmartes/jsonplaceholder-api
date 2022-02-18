import Foundation
import Alamofire
import ObjectMapper

class UserListInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchUserList() {
        if let userListDefaults = PersistenceUtils().getUserDefaults(UserDefaultsKeys.userList), userListDefaults.isEmpty == false {
            presenter?.userListFetchedSuccess(userList: userListDefaults)
            return
        }
        
        AF.request(API_USER_LIST).response { (response) in
            self.handleResponse(requestResponse: response)
        }
    }
    
    private func handleResponse(requestResponse: AFDataResponse<Data?>) {
        if let error = requestResponse.error {
            presenter?.userListFetchFailed(with: error)
            return
        }
        
        if let data = requestResponse.data {
            let userList = parseJSON(data)
            PersistenceUtils().saveUserDefaults(userList)
            presenter?.userListFetchedSuccess(userList: userList)
        }
    }
    
    private func parseJSON(_ userListData: Data) -> [UserEntity] {
        let data = String(decoding: userListData, as: UTF8.self)
        guard let decoderData = Mapper<UserEntity>().mapArray(JSONString: data) else {
            print("parseJSON Error: Could not map response")
            return []
        }
        return decoderData
    }
    
}
