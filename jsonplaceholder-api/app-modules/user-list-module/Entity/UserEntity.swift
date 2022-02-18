import Foundation
import ObjectMapper

struct UserEntity: Mappable {
    private var id: Int = 0
    private var name: String = ""
    private var phone: String = ""
    private var email: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        phone <- map["phone"]
        email <- map["email"]
    }
    
    func getId() -> Int {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func getPhone() -> String {
        return phone
    }
    
    func getEmail() -> String {
        return email
    }
    
}
