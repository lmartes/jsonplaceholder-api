import Foundation
import Alamofire
import ObjectMapper

class UserPostInteractor: PresenterToInteractorUserPostProtocol {
    var presenter: InteractorToPresenterUserPostProtocol?
    
    func fetchUserPost(with user: UserEntity) {
        print("request to: ", API_POST_LIST + "\(user.getId())")
        AF.request(API_POST_LIST + "\(user.getId())").response { (response) in
            self.handleResponse(requestResponse: response)
        }
    }
    
    private func handleResponse(requestResponse: AFDataResponse<Data?>) {
        if let error = requestResponse.error {
            presenter?.userPostFetchFailed(with: error)
            return
        }
        
        if let data = requestResponse.data {
            let userPost = parseJSON(data)
            presenter?.userPostFetchedSuccess(userPosts: userPost)
        }
    }
    
    private func parseJSON(_ userPostData: Data) -> [PostEntity] {
        let data = String(decoding: userPostData, as: UTF8.self)
        guard let decoderData = Mapper<PostEntity>().mapArray(JSONString: data) else {
            print("parseJSON Error: Could not map response")
            return []
        }
        return decoderData
    }
    
}
