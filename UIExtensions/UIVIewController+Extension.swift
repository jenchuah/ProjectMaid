//
//  UIVIewController+Extension.swift
//  
//
//  Created by Jen Min Chuah on 11/10/18.
//

import Foundation

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addToContainer(_ container: UIView, of parentViewController: UIViewController) {
        parentViewController.addChild(self)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self.view)
        NSLayoutConstraint.activate([
            self.view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0),
            self.view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 0),
            self.view.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            self.view.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0)
            ])
        self.didMove(toParent: parentViewController)
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayNotification(message: String, font: UIFont, cornerRadius: CGFloat, textColor: UIColor, backgroundColor: UIColor, animationDuration: Double) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        
        label.font = font 
        label.numberOfLines = 2
        label.text = message
        label.textAlignment = NSTextAlignment.center
        
        label.center = CGPoint(x: Screen.Width/2.0, y: Screen.Height/2.0)
        label.clipsToBounds = true
        
        label.layer.cornerRadius = cornerRadius
        label.layer.masksToBounds = true
        label.alpha = 0.0
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        
        self.view.addSubview(label)
        label.fadeIn(duration: animationDuration)
        label.fadeOut(duration: animationDuration)
    }
    
    var center: CGPoint {
        let navigationBarHeight = navigationController?.navigationBar.frame.size.height ?? 0
        let tabBarHeight = tabBarController?.tabBar.frame.size.height ?? 0
        
        return CGPoint(x: Screen.Width/2, y: (Screen.Height-navigationBarHeight-tabBarHeight)/2)
    }
}
