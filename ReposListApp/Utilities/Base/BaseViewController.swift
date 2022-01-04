//
//  BaseViewController.swift
//  Tadawy
//
//  Created by MAC on 1/16/19.
//  Copyright © 2019 CodexGlobal. All rights reserved.
//

import UIKit
import Toast
import EMAlertController
import SVProgressHUD
open class BaseViewController: UIViewController, UIAlertViewDelegate {
    
    // MARK: - Variables
    
    var actionsheetTrigger: UIView?
    var alertInputTextField: UITextField?
    var titleImageView: UIImageView?
    var segmentedBarScrollView: UIScrollView?
    weak var rootViewController: BaseViewController?
    var walletIsOpen = false
    var notificationIsOepn = false
    var firstCartLoad = true
    var forceLogoutDone = false
    let walletAmount = UILabel()
    
    // MARK: - View Life Cycle
    
    override open func viewDidLoad() {
        
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        

        
    }
    
    
    override open var prefersStatusBarHidden: Bool {
        return false
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    open func SetBackTitleText(backText: String){
        let backItem = UIBarButtonItem()
        backItem.title = backText
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }

    
    
    
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


    @objc func serverDown() {
        SVProgressHUD.dismiss()
        self.presentAlert(withTitle: "", message: NSLocalizedString("server down for maintenance", comment: ""))
        
    }
    
    
    
    @objc func clickOnTitleBtn() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    open func hideBackBtn(){
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
    open func hideNavigationBar(){
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    open func showNavigationBar(){
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.TextDarkColor, NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "Tajawal-Bold", size: 20), size: 20)]
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    func setNavigationBarRightBtns() {
    }
    
    
    open func setNavBackText(){
        navigationController?.navigationBar.topItem?.title   = NSLocalizedString("BACK", comment: "")

    }

    
    func removeNotificationBell() {
        self.navigationItem.rightBarButtonItems = []
    }
    
    
    // MARK: - Actions
    func presentAlert(withTitle title: String, message: String) {
        
        
        let alert = EMAlertController(title: "", message: message)
        
        //let cancel = EMAlertAction(title: "CANCEL", style: .cancel)
        let confirm = EMAlertAction(title: NSLocalizedString("OK", comment: ""), style: .normal)
      //  confirm.applyGradient(colours: [.purple,.red ,.orange ]) 
        confirm.actionBackgroundColor = UIColor.AppMainColor
        confirm.titleColor = UIColor.white
        
        //alert.addAction(cancel)
        alert.addAction(confirm)
        
        let icon = UIImage(named: "Warning-Sign")
        alert.iconImage = icon
        
        alert.titleColor = UIColor.AppMainColor
        alert.messageColor = UIColor.AppMainColor
        alert.cornerRadius = 10
        alert.view.borderColor = UIColor.AppMainColor
        alert.backgroundColor = UIColor.white
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func presentUnavailableServiceAlert(withTitle title: String, message: String, imgUrl: String) {
        
        
        let alert = EMAlertController(title: "", message: message)
        
        //let cancel = EMAlertAction(title: "CANCEL", style: .cancel)
        let confirm = EMAlertAction(title: NSLocalizedString("OK", comment: ""), style: .normal)
        confirm.actionBackgroundColor = UIColor.AppMainColor
        confirm.titleColor = UIColor.TextDarkColor
        //alert.addAction(cancel)
        alert.addAction(confirm)
        
        let icon = UIImage(named: "Warning-Sign")
        let url = URL(string: imgUrl)
        if let data = try? Data(contentsOf: url!) {
            alert.iconImage = UIImage(data: data)
        }else{
            alert.iconImage = icon
        }
        //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        //imageView.image = UIImage(data: data!)
        //let imgview = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        
        alert.titleColor = UIColor.TextLightColor
        alert.messageColor = UIColor.TextLightColor
        alert.cornerRadius = 10
        alert.view.borderColor = UIColor.AppMainColor
        alert.backgroundColor = UIColor.BGDark
        self.present(alert, animated: true, completion: nil)
        
    }
    
    open func showAlertWithDismiss(_ title: String, message: String) {
        //        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        //        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil))
        //
        //        alert.view.backgroundColor = UIColor.BGDark
        let alert = EMAlertController(title: "", message: message)
        
        //let cancel = EMAlertAction(title: "CANCEL", style: .cancel)
        let confirm = EMAlertAction(title: NSLocalizedString("OK", comment: ""), style: .normal)
        confirm.actionBackgroundColor = UIColor.AppMainColor
        confirm.titleColor = UIColor.TextDarkColor
        //alert.addAction(cancel)
        alert.addAction(confirm)
        
        let icon = UIImage(named: "Warning-Sign")
        alert.iconImage = icon
        
        alert.titleColor = UIColor.TextLightColor
        alert.messageColor = UIColor.TextLightColor
        alert.cornerRadius = 10
        alert.view.borderColor = UIColor.AppMainColor
        alert.backgroundColor = UIColor.white
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
                
            }
            
            // topController should now be your topmost view controller
            topController.present(alert, animated: true, completion:nil)
            
        }
        
    }
    
    open func refresh() {
        
    }
    
    @IBAction open func back() {
        if(self.navigationController != nil) {
            _ = self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    open func back(_ completion:@escaping () -> Void) {
        if(self.navigationController != nil) {
            _ = self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: completion)
        }
    }
    
    @IBAction open func endEditing() {
        self.view.endEditing(true)
    }
    
    // MARK: Shake
    
    open func vibrate() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x:self.view.center.x - 10.0, y:self.view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x:self.view.center.x + 10.0, y:self.view.center.y))
        self.view.layer.add(animation, forKey: "position")
    }
    
    
    @objc open func endEdting() {
        self.view.endEditing(true)
    }
    
    // MARK: Alerts & Toasts
    
    open func showToastWith(_ message: String) {
        showSemiHighToastWith(message)
//        showHighToastWith(message)

    }
    open func showHighToastWith(_ message: String) {
        let style: CSToastStyle = CSToastStyle(defaultStyle: ())
        style.messageFont = UIFont(name: "Tajawal-Regular", size: 11.0)!
        style.messageAlignment = .center
        let x = UIScreen.main.bounds.width / 2
        let y: CGFloat = UIScreen.main.bounds.height - 138
        DispatchQueue.main.async {
            self.view.makeToast(message, duration: 2.0, position: NSValue(cgPoint: CGPoint(x: x, y: y)), style: style)
        }
    }
    
    open func showSemiHighToastWith(_ message: String) {
        let style: CSToastStyle = CSToastStyle(defaultStyle: ())
        style.messageFont = UIFont(name: "Tajawal-Regular", size: 11.0)!
        style.messageAlignment = .center
        let x = UIScreen.main.bounds.width / 2
        let y: CGFloat = self.view.frame.size.height - 75
        DispatchQueue.main.async {
            
//            UIApplication.shared.windows.first?.rootViewController?.view.makeToast(message, duration: 2.0, position: NSValue(cgPoint: CGPoint(x: x, y: y)), style: style)
            self.view.makeToast(message, duration: 2.0, position: NSValue(cgPoint: CGPoint(x: x, y: y)), style: style)
        }
    }
    open func showTopToastWith(_ message: String) {
        let style: CSToastStyle = CSToastStyle(defaultStyle: ())
        style.messageFont = UIFont(name: "HelveticaNeue", size: 11.0)!
        style.messageAlignment = .center
        
        DispatchQueue.main.async {
            self.view.makeToast(message, duration: 2.0, position: CSToastPositionTop, style: style)
        }
    }
    
    // MARK: Placeholders
    
    open func setupPlaceHolderFor(_ textField: UITextField, withText placeHolder: String, textAlighnment alignment: NSTextAlignment, fontSize size: CGFloat, andColor color: UIColor) {
        
        let completeValue = NSMutableAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: size)!])
        
        textField.attributedPlaceholder = completeValue
        textField.textAlignment = alignment
        
    }
    
}
extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}

