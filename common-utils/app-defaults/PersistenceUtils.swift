import Foundation
import ObjectMapper

class PersistenceUtils {
    func saveUserDefaults(_ userList: [UserEntity]) {
        guard let data = userList.toJSONString(prettyPrint: false) else {
            return
        }
        
        UserDefaults.standard.set(data, forKey: UserDefaultsKeys.userList)
        UserDefaults.standard.synchronize()
    }
    
    func getUserDefaults() -> [UserEntity] {
        guard let userListDefaults = UserDefaults.standard.string(forKey: UserDefaultsKeys.userList) else {
            return []
        }
        
        guard let userList = Mapper<UserEntity>().mapArray(JSONString: userListDefaults) else {
            print("parseJSON Error: Could not map response")
            return []
        }
        
        return userList
    }
    
    func userListOnUserDefaultsIsEmpty() -> Bool {
        return PersistenceUtils().getUserDefaults().isEmpty
    }
    
}
