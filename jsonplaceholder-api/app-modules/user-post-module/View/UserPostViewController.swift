import UIKit
import SVProgressHUD

class UserPostViewController: UIViewController {
    @IBOutlet weak var userDataView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
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
    
    private func setupView(with userData: UserEntity) {
        showUserData()
        name.text = userData.getName()
        phone.text = userData.getPhone()
        email.text = userData.getEmail()
    }
    
    private func showUserData() {
        userDataView.isHidden = false
    }
}

//MARK: - PresenterToView
extension UserPostViewController: PresenterToViewUserPostProtocol {
    func showUserPost(with posts: [PostEntity], userData: UserEntity) {
        setupView(with: userData)
        userPosts = posts
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

//MARK: - Table View Delegate
extension UserPostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userPostCell = tableView.dequeueReusableCell(withIdentifier: Identifier.userPostCell) as? UserPostTableViewCell else {
            return UITableViewCell()
        }
        userPostCell.setupView(post: userPosts[indexPath.row])
        return userPostCell
    }
    
}

