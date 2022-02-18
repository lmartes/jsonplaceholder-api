import UIKit
import SVProgressHUD

class UserListViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ViewToPresenterUserListProtocol?
    var userList: [UserEntity] = []
    var filteredUserList: [UserEntity] = []
    var isFiltering: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserListRouter.createUserListModule(userListReference: self)
        setDelegates()
        presenter?.startFetchingUserList()
        SVProgressHUD.show(withStatus: "Cargando...")
    }
    
    private func setDelegates() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }

}

//MARK: - PresenterToView
extension UserListViewController: PresenterToViewUserListProtocol {
    func showUserList(with users: [UserEntity]) {
        userList = users
        tableView.reloadData()
        
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    func showError(_ error: Error) {
        SVProgressHUD.dismiss()
        let alert = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - Search Bar Delegate
extension UserListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUserList = userList
        
        if searchText.isEmpty == false {
            filteredUserList = userList.filter({ $0.getName().contains(searchText) })
            isFiltering = true
        }
        
        tableView.reloadData()
    }
    
}

//MARK: - Table View Delegate
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredUserList.count : userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userListCell = tableView.dequeueReusableCell(withIdentifier: Identifier.userListCell) as? UserListTableViewCell else {
            return UITableViewCell()
        }
        
        let user: UserEntity
        if isFiltering {
            user = filteredUserList[indexPath.row]
        } else {
            user = userList[indexPath.row]
        }
        
        userListCell.setupView(user: user)
        return userListCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user: UserEntity
        if isFiltering {
            user = filteredUserList[indexPath.row]
        } else {
            user = userList[indexPath.row]
        }
        
        presenter?.showUserPostView(with: user, from: self)
    }
    
}
