//
//  Utility.swift


import UIKit
import AVKit
import Photos

struct Utility{

//    /// MARK: - MBProgress Indicator Methods
//    func showLoader() {
//        DispatchQueue.main.async {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true
//            hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
//            UIApplication.shared.keyWindow?.addSubview(hud)
//            hud.mode = .indeterminate
//        }
//    }
//
//    func hideLoader() {
//        DispatchQueue.main.async {
//            if UIApplication.shared.isNetworkActivityIndicatorVisible {
//                UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            }
//            hud.removeFromSuperview()
//        }
//    }
    
    //MARK: - Check Null or Nil Object
    
    func isObjectNotNil(object:AnyObject!) -> Bool
    {
        if let _:AnyObject = object
        {
            return true
        }
        
        return false
    }
    


}

//MARK: - DispatchQueue

func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}

func mainThread(_ completion: @escaping () -> ()) {
    DispatchQueue.main.async {
        completion()
    }
}
//userInteractive
//userInitiated
//default
//utility
//background
//unspecified
func backgroundThread(_ qos: DispatchQoS.QoSClass = .background , completion: @escaping () -> ()) {
    DispatchQueue.global(qos:qos).async {
        completion()
    }
}
// MARK: - Platform

struct Platform {
    
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
}



// MARK: - Documents Directory Clear

func clearTempFolder() {
    let fileManager = FileManager.default
    let tempFolderPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    do {
        let filePaths = try fileManager.contentsOfDirectory(atPath: tempFolderPath)
        for filePath in filePaths {
            try fileManager.removeItem(atPath: tempFolderPath + "/" + filePath)
        }
    } catch {
        print("Could not clear temp folder: \(error)")
    }
}




// MARK: - Trim String

func trimString(string : NSString) -> NSString {
    return string.trimmingCharacters(in: NSCharacterSet.whitespaces) as NSString
}

// MARK: - Alert and Action Sheet Controller

func showAlertView(_ strAlertTitle : String, strAlertMessage : String) -> UIAlertController {
    let alert = UIAlertController(title: strAlertTitle, message: strAlertMessage, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:{ (ACTION :UIAlertAction!)in
    }))
    return alert
}

// MARK:- Navigation

func viewController(withID ID : String) -> UIViewController {
    let controller = Constants.mainStoryboard.instantiateViewController(withIdentifier: ID)
    return controller
}

// MARK:- UIButton Corner Radius

func cornerLeftButton(btn : UIButton) -> UIButton {
    
    let path = UIBezierPath(roundedRect:btn.bounds, byRoundingCorners:[.topLeft, .bottomLeft], cornerRadii: CGSize.init(width: 5, height: 5))
    let maskLayer = CAShapeLayer()
    
    maskLayer.path = path.cgPath
    btn.layer.mask = maskLayer
    
    return btn
}

func cornerRightButton(btn : UIButton) -> UIButton {
    
    let path = UIBezierPath(roundedRect:btn.bounds, byRoundingCorners:[.topRight, .bottomRight], cornerRadii: CGSize.init(width: 5, height: 5))
    let maskLayer = CAShapeLayer()
    
    maskLayer.path = path.cgPath
    btn.layer.mask = maskLayer
    
    return btn
}

// MARK:- UITextField Corner Radius

func cornerLeftTextField(textfield : UITextField) -> UITextField {
    
    let path = UIBezierPath(roundedRect:textfield.bounds, byRoundingCorners:[.topLeft, .bottomLeft], cornerRadii: CGSize.init(width: 2.5, height: 2.5))
    let maskLayer = CAShapeLayer()
    
    maskLayer.path = path.cgPath
    textfield.layer.mask = maskLayer
    
    return textfield
}

// MARK:- UserDefault Methods

func setUserDefault(ObjectToSave : AnyObject?  , KeyToSave : String) {
    let defaults = UserDefaults.standard
    
    if (ObjectToSave != nil)
    {
        
        defaults.set(ObjectToSave, forKey: KeyToSave)
    }
    
    UserDefaults.standard.synchronize()
}

func getUserDefault(KeyToReturnValye : String) -> AnyObject? {
    let defaults = UserDefaults.standard
    
    if let name = defaults.value(forKey: KeyToReturnValye)
    {
        return name as AnyObject?
    }
    return nil
}


// MARK: - Image Upload WebService Methods

func generateBoundaryString() -> String{
    return "Boundary-\(UUID().uuidString)"
}

func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}


// MARK: - Camera Permissions Methods

func checkCameraPermissionsGranted() -> Bool {
    var cameraPermissionStatus : Bool = false
    if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
        // Already Authorized
        cameraPermissionStatus = true
        return true
    } else {
        AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted: Bool) -> Void in
            if granted == true {
                // User granted
                cameraPermissionStatus = granted
                print("Granted access to Camera");
            } else {
                // User rejected
                cameraPermissionStatus = granted
                print("Not granted access to Camera");
            }
        })
        return cameraPermissionStatus
    }
}

// MARK: - Photo Library Permissions Methods

func checkPhotoLibraryPermissionsGranted() -> Bool {
    var photoLibraryPermissionStatus : Bool = false
    let status = PHPhotoLibrary.authorizationStatus()
    if (status == PHAuthorizationStatus.authorized) {
        // Access has been granted.
        photoLibraryPermissionStatus = true
    }
    else if (status == PHAuthorizationStatus.denied) {
        // Access has been denied.
        photoLibraryPermissionStatus = false
    }
    else if (status == PHAuthorizationStatus.notDetermined) {
        // Access has not been determined.
        PHPhotoLibrary.requestAuthorization({ (newStatus) in
            if (newStatus == PHAuthorizationStatus.authorized) {
                photoLibraryPermissionStatus = true
            }
            else {
                photoLibraryPermissionStatus = false
            }
        })
    }
    else if (status == PHAuthorizationStatus.restricted) {
        // Restricted access - normally won't happen.
        photoLibraryPermissionStatus = false
    }
    return photoLibraryPermissionStatus
}

// MARK: - Set NavigationBar Methods

func setNavigationBar(viewController : UIViewController, strTitleName : String) {
    let titleDict: NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.whiteColor]
    viewController.navigationController?.navigationBar.titleTextAttributes = (titleDict as! [NSAttributedString.Key : Any])
    
    viewController.navigationController?.navigationBar.tintColor = .whiteColor()
    
    viewController.navigationItem.title = strTitleName
    viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

    viewController.navigationController?.navigationBar.backgroundColor = UIColor.blue
}


func setNavigation(){
    UINavigationBar.appearance().barTintColor = .defaultBlueColor()
    UINavigationBar.appearance().tintColor = .whiteColor()
    //    UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor:Constants.RGBColorCodes.cNavigationBarColor]
    UINavigationBar.appearance().isTranslucent = false
    //    UIApplication.shared.statusBarView?.backgroundColor = Constants.RGBColorCodes.defaultBlueColor
    UINavigationBar.appearance().titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: .fontOpenSansRegular, size: 20)!]
}

// MARK: - Set TabBarController NavigationBar Methods

func setTabBarControllerNavigationBar(viewController : UIViewController, strTitleName : String) {
    
    let titleDict: NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.whiteColor]
    viewController.tabBarController?.navigationController?.navigationBar.titleTextAttributes = titleDict as? [NSAttributedString.Key : Any]
    
    viewController.tabBarController?.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

    viewController.tabBarController?.navigationController?.navigationBar.tintColor = .whiteColor()
    viewController.tabBarController?.navigationItem.title = strTitleName
    viewController.tabBarController?.navigationController?.navigationBar.backgroundColor = .defaultBlueColor()
    viewController.tabBarController?.navigationController?.navigationBar.isTranslucent = false
 
}


