

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        getRandomPhoto()
        let button = UIButton(frame: CGRect(x: 100,
                                                  y: 800,
                                                  width: 200,
                                                  height: 60))
              button.setTitle("Save",
                              for: .normal)
              button.setTitleColor(.systemBlue,
                                   for: .normal)
              
              button.addTarget(self,
                               action: #selector(buttonAction),
                               for: .touchUpInside)
              
              self.view.addSubview(button)
              
              // Do any additional setup after loading the view.
          }

          @objc
          func buttonAction() {
              print("Button pressed")
          }

    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600X600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
}

