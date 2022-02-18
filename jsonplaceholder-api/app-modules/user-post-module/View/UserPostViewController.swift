import UIKit
import SVProgressHUD

class UserPostViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ViewToPresenterUserPostProtocol?
    var userPosts: [PostEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        presenter?.startFetchingUserPost()
        SVProgressHUD.show(withStatus: "Cargando...")
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

//MARK: - PresenterToView
extension UserPostViewController: PresenterToViewUserPostProtocol {
    func showUserPost(with posts: [PostEntity]) {
        print("Actualizar post")
    }
    
    func showError(_ error: Error) {
        print("hubo un error: ", error.localizedDescription)
    }
    
}

//MARK: - Table View Delegate
extension UserPostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return userPosts.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userListCell = tableView.dequeueReusableCell(withIdentifier: Identifier.userListCell) as? UserListTableViewCell else {
            return UITableViewCell()
        }
        //userListCell.setupView(user: userPosts[indexPath.row])
        return userListCell
    }
    
}

