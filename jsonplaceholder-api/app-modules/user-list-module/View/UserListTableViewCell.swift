import UIKit

class UserListTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }    

    func setupView(user: UserEntity) {
        name.text = user.getName()
        phone.text = user.getPhone()
        email.text = user.getEmail()
    }
}
