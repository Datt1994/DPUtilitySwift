//
//  Utility.swift

import UIKit
import Foundation

extension UIColor {
    class func defaultBlueColor() -> UIColor { return UIColor(r: 71, g: 122, b: 164) }
    class func lightBorderColor() -> UIColor { return UIColor(r: 204, g: 204, b: 204) }
    class func lightBlueViewBGColor() -> UIColor { return UIColor(r: 227, g: 238, b: 254) }
    
    class func blackColor() -> UIColor { return UIColor.black }
    class func whiteColor() -> UIColor { return UIColor.white }
    class func lightGrayColor() -> UIColor { return UIColor.lightGray }
    class func grayColor() -> UIColor { return UIColor.gray }
    class func darkGrayColor() -> UIColor { return UIColor.darkGray }
    class func redColor() -> UIColor { return UIColor.red }
    class func clearColor() -> UIColor { return UIColor.clear }
}


extension String {
    // MARK: - Font Name
    static let fontOpenSansRegular       = "OpenSans"
    static let fontOpenSansBold          = "OpenSans-Bold"
    static let fontOpenSansSemibold      = "OpenSans-Semibold"
    static let fontLatoBold              = "Lato-Bold"
    
    // MARK: - StoryBoard Identifier's
    static let sIdSlideMenuVC            = "SlideMenuVC"

    // cell Identifier's
    static let sIdSlideMenuCell          = "SlideMenuCell"
    
    // MARK: - Message's
    static let msgNetworkConnection = "You are not connected to internet. Please connect and try again"
}


struct Constants {
    // MARK: - Global Utility
    static let appName    = Bundle.main.infoDictionary!["CFBundleName"] as! String
    static let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //MARK: - device type
    enum UIUserInterfaceIdiom : Int{
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }
    
    struct DateFormat
    {
        static let date = "dd/MM/yy"
        static let time = "hh:mm a"
    }
    
    struct WebServiceURLs {
        static let mainURL = "http://198.58.98.34:4220/api"
        static let signUpURL = mainURL + "/register"
        static let signInURL = mainURL + "/login"
    }

}
