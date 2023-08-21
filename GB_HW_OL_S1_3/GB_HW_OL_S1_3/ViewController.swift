//
//  ViewController.swift
//  GB_HW_OL_S1_3
//
//  Created by OL on 09.08.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=" + AppCode.appCode + "&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token")
        webView.load(URLRequest(url: url!))
    }
    
    private func setupViews() {
        view.addSubview(webView)
    }
    
    private func tap() {
        
        let tab1 = UINavigationController(rootViewController: FriendsViewController())
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))

        tab1.tabBarItem.title = "Friends"
        tab2.tabBarItem.title = "Groups"
        tab3.tabBarItem.title = "Photos"

        let controllers = [tab1, tab2, tab3]

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first else {
            return
        }

        firstWindow.rootViewController =  tabBarController
        
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        
        NetworkService.token = params["access_token"]!
        NetworkService.userID = params["user_id"]!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        tap()
    }
    
     
    
    
//    private var imageView = UIImageView(image: UIImage (named: "LogoPandomat" ))
//
//    private var label: UILabel = {
//        let label = UILabel ()
//        label.text = "Авторизация"
//        label.textAlignment = .center
//        label.font = UIFont (name: "", size: 64)
//        label.textColor = .white
//        label.backgroundColor = .systemGreen
//        return label
//    }()
    
//    private var loginField: UITextField = {
//        let login = UITextField()
//        login.borderStyle = .line
//        login.layer.borderWidth = 2
//        login.layer.borderColor = UIColor.black.cgColor
//        login.textColor = .black
//        login.backgroundColor = .systemGray6
//        let userText = NSAttributedString(string: "Логин", attributes:[NSAttributedString.Key.foregroundColor: UIColor.darkGray])
//        login.attributedPlaceholder = userText
//        return login
//    }()
//
//    private var passwordField: UITextField = {
//        let password = UITextField()
//        password.borderStyle = .line
//        password.layer.borderWidth = 2
//        password.layer.borderColor = UIColor.black.cgColor
//        password.textColor = .black
//        password.backgroundColor = .systemGray6
//        let userText = NSAttributedString(string: "Пароль", attributes:[NSAttributedString.Key.foregroundColor: UIColor.darkGray])
//        password.attributedPlaceholder = userText
//        return password
//    }()
    
        
//    private var button: UIButton = {
//        let button = UIButton ( )
//        button.setTitle("Войти", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.setTitleColor(.systemBlue, for: .highlighted)
//        button.backgroundColor = .systemGreen
//        return button
//    }()
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // UIImage(named: "LogoPandomat")
//        view.backgroundColor = .white
//        // button.backgroundColor = UIColor.systemBlue
//        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
//        setupViews()
//    }
    

      
//    private func setupViews () {
//        view.addSubview(imageView)
//        view.addSubview(label)
//        view.addSubview(loginField)
//        view.addSubview(passwordField)
//        view.addSubview(button)
//        setupConstraints()
//    }
    
//    private func setupConstraints () {
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        label.translatesAutoresizingMaskIntoConstraints = false
//        loginField.translatesAutoresizingMaskIntoConstraints = false
//        passwordField.translatesAutoresizingMaskIntoConstraints = false
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50),
//            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.1),
//            imageView.heightAnchor.constraint(equalToConstant: 240),
//
//            label.topAnchor.constraint (equalTo: imageView.bottomAnchor, constant: 0),
//            label.leadingAnchor.constraint (equalTo: view.leadingAnchor, constant: 20),
//            label.trailingAnchor.constraint (equalTo: view.trailingAnchor, constant: -20),
//            label.heightAnchor.constraint (equalToConstant: 50),
//
//            loginField.topAnchor.constraint (equalTo: label.bottomAnchor, constant: 30),
//            loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
//            loginField.heightAnchor.constraint(equalToConstant: 50),
//
//            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 10),
//            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
//            passwordField.heightAnchor.constraint(equalToConstant: 50),
//
//            button.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 50),
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
//            button.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
    
 
}

