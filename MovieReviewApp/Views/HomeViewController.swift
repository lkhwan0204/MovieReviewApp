
import UIKit

class HomeViewController: UIViewController {
    var collectionView: UICollectionView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupCollectionView()
        loadMovies()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width * 0.45, height: 250)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        view.addSubview(collectionView)
    }
    
    func loadMovies() {
        if let url = Bundle.main.url(forResource: "movies", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            movies = (try? decoder.decode([Movie].self, from: data)) ?? []
            collectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
}
