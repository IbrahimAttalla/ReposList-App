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
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadNavigationBar), name: .reloadNavigationBar, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(logOut), name: .forceLogOut, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(showCartView), name: .showCart, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(serverDown), name: .serverDown, object: nil)
        
        
        
        
        if L102Language.currentAppleLanguage() == "ar" {
            loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: self.view.subviews)
        }
        
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: R.image.auth.backNavBtn(), style: .plain, target: nil, action: nil)
        
//        self.navigationController?.navigationBar.backIndicatorImage =  R.image.auth.backNavBtn()
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = R.image.auth.backNavBtn()
//        self.navigationController?.navigationBar.backItem?.title = ""
        
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
////        self.navigationController?.navigationBar.backIndicatorImage =  R.image.auth.backNavBtn()
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = R.image.auth.backNavBtn()
//        self.navigationController?.navigationBar.backItem?.title = ""
//
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: NSLocalizedString("BACK", comment: ""), style: .plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: R.image.auth.backNavBtn(), style: .plain, target: nil, action: nil)

        
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

    /*
    open func addLogoToNavBar(){
        
        // MARK:- center titel view
        //        let logo = UIImage(named: "MiniLogo")
        //        let imageView = UIImageView(image:logo)
        //        imageView.contentMode = .scaleAspectFit
        //        self.navigationItem.titleView = imageView
        
        // MARK:- center  ( button to route to home for ever )titel view
        //        let button =  UIButton(type: .custom)
        //        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        //        button.backgroundColor = .clear
        //        //button.setTitle("Button", for: .normal)
        //        button.setImage(UIImage(named: "MiniLogo"), for: .normal)
        //        button.addTarget(self, action: #selector(clickOnTitleBtn), for: .touchUpInside)
        //        navigationItem.titleView = button
        
        
        // MARK:- wallet view
        
        let walletLbl = UILabel()
        walletLbl.font = UIFont.boldSystemFont(ofSize: 14)
        walletLbl.text = NSLocalizedString("WALLET_Lbl", comment: "")
        walletLbl.textColor = UIColor.AppMainColor
        //        walletLbl.backgroundColor = .red
        walletLbl.textAlignment = .center
        
        walletAmount.font = UIFont.systemFont(ofSize: 11)
        //        walletAmount.text = "$ 0.0"
        walletAmount.textColor = UIColor.TextGrayColor
        walletAmount.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [walletLbl, walletAmount])
        stackView.axis = .vertical
        stackView.spacing = -2
        
        let seperatorImg = UIImageView()
        seperatorImg.image = UIImage(named: "navigation seperator Line ")
        seperatorImg.frame = CGRect(x: 0, y: 0, width: 20, height:60)
        seperatorImg.contentMode = .scaleToFill
        seperatorImg.backgroundColor = .red
        
        //        let currancyLbl1 = UILabel()
        //        currancyLbl1.font = UIFont.systemFont(ofSize: 14)
        //        currancyLbl1.text = ""
        //        currancyLbl1.textColor = UIColor.TextGrayColor
        //        currancyLbl1.textAlignment = .center
        //        currancyLbl1.backgroundColor = .red
        //        currancyLbl1.frame.size = CGSize(width: 5, height: 50),
        //        let seperatorView = UIView()
        //        let size = CGSize(width: 5, height: 20)
        //        seperatorView.frame.size = size
        //        seperatorView.backgroundColor = UIColor.red
        
        
        //        let seperatorStack = UIStackView(arrangedSubviews: [seperatorView])
        //        seperatorStack.axis = .horizontal
        let fullStackView = UIStackView(arrangedSubviews: [ stackView, seperatorImg])
        fullStackView.axis = .horizontal
        fullStackView.alignment = .fill
        fullStackView.spacing = 10
        let button2 = UIBarButtonItem()
        
        button2.customView = fullStackView
        //                let button2 = UIBarButtonItem(image: UIImage(named: "SideMenuBtn"), style: .plain, target: self, action: #selector(walletViewTapped)) // action:#selector(Class.MethodName) for swift 3
        
        
        //    navigationItem.titleView = stackView
        let button1 = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(walletViewTapped)) // action:#selector(Class.MethodName) for swift 3
        
        //MARK:- notification view
        let notificationImg = UIImageView()
        notificationImg.image = UIImage(named: "notificationLogo")
        notificationImg.sizeThatFits(CGSize(width: 25, height: 25))
        
        
        let notificationCounterLbl = UILabel()
        notificationCounterLbl.font = UIFont.systemFont(ofSize: 15)
        notificationCounterLbl.text = "0"
        notificationCounterLbl.textColor = UIColor.black
        notificationCounterLbl.textAlignment = .center
        notificationCounterLbl.backgroundColor = UIColor.AppMainColor
        
        notificationCounterLbl.layer.cornerRadius = 11
        notificationCounterLbl.clipsToBounds = true
        
        let stackView1 = UIStackView(arrangedSubviews: [notificationImg,notificationCounterLbl ])
        stackView1.axis = .vertical
        stackView1.spacing = -5
        
        let btun1 = UIBarButtonItem()
        btun1.customView = stackView1
        self.navigationItem.rightBarButtonItems = [btun1,button2]
        
        
        //MARK:- Actions
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.notificationViewTapped(sender:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.notificationViewTapped(sender:)))
        
        notificationCounterLbl.isUserInteractionEnabled = true
        notificationCounterLbl.addGestureRecognizer(tapGesture1)
        
        notificationImg.isUserInteractionEnabled = true
        notificationImg.addGestureRecognizer(tapGesture2)
        
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(self.walletViewTapped(sender:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(self.walletViewTapped(sender:)))
        
        walletLbl.isUserInteractionEnabled = true
        walletLbl.addGestureRecognizer(tapGesture4)
        
        walletAmount.isUserInteractionEnabled = true
        walletAmount.addGestureRecognizer(tapGesture3)
        
        
        reloadNavigationBar()
    }

    */
    open func navBarBackGround(catId :Int){
        print("navBarBackGround " , catId)
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            guard let self = self  else {return}
        switch catId {
        case 1:
            self.navigationController?.navigationBar.barTintColor = R.color.carCatBG()

        case 2:
            self.navigationController?.navigationBar.barTintColor = R.color.realestateCatBG()

        case 3:
            self.navigationController?.navigationBar.barTintColor = R.color.electronicCatBG()

        case 4:
            self.navigationController?.navigationBar.barTintColor = R.color.mobileCatBG()

        case 5:
            self.navigationController?.navigationBar.barTintColor = R.color.otherCatBG()

        default:
            self.navigationController?.navigationBar.barTintColor = R.color.appMainColor()
        }
            self.navigationController?.navigationBar.tintColor = .white
            
        }
    }
    
    
    open func navBarSetting(backImg:UIImage? , backTitle:String? , navTitle:String?, navBigSize:Bool?){
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.navigationController?.navigationBar.barTintColor = R.color.appMainColor()

            if backTitle != nil {
                print("backTitle == ",backTitle!)
                self?.navigationController?.navigationBar.backItem?.title = ""
//                self?.navigationController?.navigationBar.backItem?.backBarButtonItem?.title = backTitle ?? ""
            }else{
                self?.navigationController?.navigationBar.backItem?.title = ""
//                self?.navigationController?.navigationBar.backItem?.backBarButtonItem?.title  = ""
            }

            
        
        if backImg != nil {
            self?.navigationController?.navigationBar.backIndicatorImage = backImg
            self?.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImg

        }else{
            self?.navigationController?.navigationBar.backIndicatorImage =  R.image.auth.backNavBtn()
            self?.navigationController?.navigationBar.backIndicatorTransitionMaskImage = R.image.auth.backNavBtn()

        }
        
        
        
        if navBigSize ?? false {
            self?.navigationController?.navigationBar.prefersLargeTitles = navBigSize ?? true
            self?.navigationController?.navigationBar.backItem?.title = ""
            self?.navigationController?.navigationItem.largeTitleDisplayMode =  .automatic
            self?.title = navTitle

        }else{
            self?.navigationController?.navigationBar.prefersLargeTitles = navBigSize!
            self?.navigationController?.navigationBar.backItem?.title = navTitle
        }
          

        }

//        DispatchQueue.main.async { [weak self] in
//
//            if backTitle != nil {
//                print("backTitle == ",backTitle)
//                self?.navigationController?.navigationBar.backItem?.title = backTitle ?? ""
////                self?.navigationController?.navigationBar.backItem?.backBarButtonItem?.title = backTitle ?? ""
//            }else{
//                self?.navigationController?.navigationBar.backItem?.title = ""
////                self?.navigationController?.navigationBar.backItem?.backBarButtonItem?.title  = ""
//            }
//
//
//
//        if backImg != nil {
//            self?.navigationController?.navigationBar.backIndicatorImage = backImg
//            self?.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImg
//
//        }else{
//            self?.navigationController?.navigationBar.backIndicatorImage =  R.image.auth.backNavBtn()
//            self?.navigationController?.navigationBar.backIndicatorTransitionMaskImage = R.image.auth.backNavBtn()
//
//        }
//
//
//
//        if navBigSize ?? false {
//            self?.navigationController?.navigationBar.prefersLargeTitles = navBigSize ?? true
//            self?.navigationController?.navigationBar.backItem?.title = ""
//            self?.title = navTitle
//
//        }else{
//            self?.navigationController?.navigationBar.prefersLargeTitles = navBigSize!
//            self?.navigationController?.navigationBar.backItem?.title = navTitle
//        }
//
//
//        }
        
    }
    
    @objc func logOut() {
        
        print("forceLogoutDone => ", forceLogoutDone)
        if !forceLogoutDone {
            
//            let defaults = UserDefaults.standard
//            defaults.removeObject(forKey: "UserData")
//            defaults.removeObject(forKey: "Access_Token")
//            defaults.synchronize()
//            forceLogoutDone = true
//
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//            self.present(vc, animated: true, completion: nil)
      
        }
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
//        let backItem = UIBarButtonItem()
//        backItem.title = NSLocalizedString("BACK", comment: "")
//        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
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
        
        alert.titleColor = UIColor.TextDarkColor
        alert.messageColor = UIColor.TextDarkColor
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

