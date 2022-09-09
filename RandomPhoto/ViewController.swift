

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
    private let button1: UIButton = {
        let button1 = UIButton()
        button1.backgroundColor = .white
        button1.setTitle("Save",for: .normal)
        button1.setTitleColor(.systemBlue,for: .normal)
       
        return button1
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        view.addSubview(button1)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button1.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
    }
    @objc func didTapButton() {
        getRandomPhoto()

    }
    @objc func buttonAction() {
                print("Button pressed")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
        button1.frame = CGRect(x: 30, y: view.frame.size.height-90-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
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


