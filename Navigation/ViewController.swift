//
//  ViewController.swift
//  Navigation
//
//  Created by Admin on 3/17/21.
//

import UIKit

// TODO 6: create protocol to update title
protocol Titledelegate: class {
    func changeTitle(newTitle: String)
}

class ViewController: UIViewController {
    
    private var pushButton = UIButton()
    private var presentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // TODO 2: set title
        title = "Home"
        
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.setTitle("Push", for: .normal)
        pushButton.setTitleColor(.black, for: .normal)
        pushButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        pushButton.layer.cornerRadius = 4
        pushButton.addTarget(self, action: #selector(pushViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(pushButton)
        
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.black, for: .normal)
        pushButton.layer.cornerRadius = 4
        presentButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        presentButton.addTarget(self, action: #selector(presentViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(presentButton)
        
        setUpViews()
    }
    
    func setUpViews() {
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -6),
            pushButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            pushButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 12),
            presentButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            presentButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc func pushViewControllerButtonPressed() {
        // TODO 3: create VC to push
        let pushVC = PushViewController()
        navigationController?.pushViewController(pushVC, animated: true)
    }
    
    @objc func presentViewControllerButtonPressed() {
        // TODO 4: create VC to present
        let presentVC = PresentViewController(placeholder: navigationController?.title ?? "")
        self.present(presentVC, animated: true, completion: nil)
        
        // TODO 9: update delegate
        presentVC.delegate = self
    }
}

// TODO 7: override protocol methods
extension ViewController: Titledelegate {
    func changeTitle(newTitle: String) {
        title = newTitle
    }
}
