import ios_combined
import Nuke
import UIKit

final class FloorMapViewController: ContentViewController {
    static func instantiate() -> FloorMapViewController {
        guard let viewController = UIStoryboard(name: "FloorMapViewController", bundle: .main).instantiateInitialViewController() as? FloorMapViewController else { fatalError() }
        return viewController
    }

    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.floorMaps
        loadMap()
    }
}

// MARK: - Private functions

private extension FloorMapViewController {
    func loadMap() {
        let width = imageView.image?.size.width
        let height = imageView.image?.size.height

        let urlString: String = "https://api.droidkaigi.jp/images/2020/map.png"
        if let url = URL(string: urlString) {
            let request = ImageRequest(
                url: url,
                processors: [ImageProcessor.Resize(size: CGSize(width: width!, height: height!))] // Set target size in pixels
            )
            Nuke.loadImage(with: request, into: imageView)
        }
    }
}
