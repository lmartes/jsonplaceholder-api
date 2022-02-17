import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    private func setDelegates() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }


}

//MARK: - Search Bar Delegate
extension UserListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("User entered: ", searchText)
    }
}

//MARK: - Table View Delegate
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userListCell = tableView.dequeueReusableCell(withIdentifier: identifier.userListCell) else {
            return UITableViewCell()
        }
        
        return userListCell
    }
    
    
}
