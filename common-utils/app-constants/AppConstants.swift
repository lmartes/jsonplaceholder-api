import Foundation

let API_USER_LIST: String = "https://jsonplaceholder.typicode.com/users"
let API_POST_LIST: String = "https://jsonplaceholder.typicode.com/posts?userId="

struct Identifier {
    static let userListViewController = "userListViewControllerIdentifier"
    static let userListCell = "userListCellIdentifier"
    static let userPostViewController = "userPostViewControllerIdentifier"
    static let userPostCell = "userPostCellIdentifier"
}

struct UserDefaultsKeys {
    static let userList = "UserListDefaults"
}
