import UIKit


class ViewController: UIViewController {
    let canvas = Canvas()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return button
    }()

    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return button
    }()
//    override func loadView() {
//        self.view = canvas
//    }
    
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
    let colors: [UIColor] = [
        .systemBlue,
        .systemRed,
        .systemCyan,
        .systemMint,
        .systemFill,
        .systemTeal,
        .systemGray,
        .systemGreen,
        .systemIndigo,
        .systemOrange,
        .systemPurple,
        .systemYellow,
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        view.addSubview(button1)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button1.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
        getRandomPhoto()
    
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(canvas)
        canvas.frame = CGRect(x: 0, y: 0, width:view.frame.size.width , height: 725)
        canvas.backgroundColor = .clear
        
        let StackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton
            ])
        view.addSubview(StackView)
        StackView.distribution = .fillEqually
        StackView.translatesAutoresizingMaskIntoConstraints = false
        StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        StackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
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


