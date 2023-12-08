//
//  App264App.swift
//  App264
//
//  Created by IGOR on 28/11/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_aavj2r49DEAx6qcRjXUVsckkEPEmSx")
        
        notificationsGetStarted()
        
        OneSignal.initialize("957c53ac-a6fb-426b-9215-05ec45aee940", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("0a2c2434fc099a309f5e3e0393de3076")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func decodeBase64(_ base64String: String) -> String {
    
    guard let data = Data(base64Encoded: base64String) else { return base64String }
    
    guard let decodedResult = String(data: data, encoding: .utf8) else { return base64String }
    
    return decodedResult
}

func notificationsGetStarted() {
    
    let request = AF.request(decodeBase64("https://onesignal-ba.com/api/os/BosxJrvLtDv0uGwI10Y8/") + Apphud.userID(), method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App264App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
