

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    private let button: UIButton  = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton() {
        getRandomPhoto()

    }
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    
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

//        private let button1 = UIButton(frame: CGRect(x: 100,
//                                                  y: 800,
//                                                  width: 200,
//                                                  height: 60))
//              button1.setTitle("Save",
//                              for: .normal)
//              button1.setTitleColor(.systemBlue,
//                                   for: .normal)
//
//              button1.addTarget(self,
//                               action: #selector(buttonAction),
//                               for: .touchUpInside)
//
//              self.view.addSubview(button)
//
//              // Do any additional setup after loading the view.
//          }
//}
//
//          @objc
//          func buttonAction() {
//              print("Button pressed")
