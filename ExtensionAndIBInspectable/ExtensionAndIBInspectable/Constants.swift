//
//  Utility.swift

import UIKit
import Foundation

extension UIColor {
    static let defaultBlueColor = UIColor.init(red: 71.0/255.0, green: 122.0/255.0, blue: 164.0/255.0, alpha: 1.0)
    static let lightBorderColor = UIColor(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1.0)
    static let lightBlueViewBGColor = UIColor(red: 227/255.0, green: 238/255.0, blue: 254/255.0, alpha: 1.0)
    static let blueLableBGColor = UIColor(red: 196/255.0, green: 219/255.0, blue: 255/255.0, alpha: 1.0)
    
    static let blackColor = UIColor.black
    static let whiteColor = UIColor.white
    static let lightGrayColor = UIColor.lightGray
    static let grayColor = UIColor.gray
    static let darkGrayColor = UIColor.darkGray
    static let redColor = UIColor.red
    static let clearColor = UIColor.clear
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
