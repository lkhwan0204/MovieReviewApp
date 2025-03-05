import UIKit

class DetailViewController: UIViewController {
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = movie.title
        view.backgroundColor = .white

        setupUI()
    }

    func setupUI() {
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 300)
        view.addSubview(descriptionLabel)
    }
}
