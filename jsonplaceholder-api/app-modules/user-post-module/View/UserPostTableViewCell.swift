import UIKit

class UserPostTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupView(post: PostEntity) {
        title.text = post.getTitle()
        body.text = post.getBody()
    }

}
