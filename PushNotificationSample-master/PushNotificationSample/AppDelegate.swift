//
//  AppDelegate.swift
//  PushNotificationSample
//
//  Created by Yuki Sumida on 2018/11/24.
//  Copyright © 2018年 Yuki Sumida. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
                                                title: "Accept",
                                                options: UNNotificationActionOptions(rawValue: 0))
        let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
                                                 title: "Decline",
                                                 options: UNNotificationActionOptions(rawValue: 0))
        var meetingInviteCategory : UNNotificationCategory?
        // Define the notification type
        if #available(iOS 11.0, *) {
            meetingInviteCategory =
                UNNotificationCategory(identifier: "MEETING_INVITATION",
                                       actions: [acceptAction, declineAction],
                                       intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "",
                                       options: .customDismissAction)
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            if (meetingInviteCategory != nil) {
                UNUserNotificationCenter.current().setNotificationCategories([meetingInviteCategory!])
            }

            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        return true
    }

}

extension AppDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        var token = ""
        deviceToken.forEach {
            token.append(String(format: "%02.2hhx", arguments: [$0]))
        }
        
        print("deviceToken: ", token)
        
         // Send  device token to server
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print ("didReceiveRemoteNotification")
        
        completionHandler(.newData)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print (response.actionIdentifier)
        switch response.actionIdentifier {
        case "ACCEPT_ACTION":
            // Handle accept
            break
            
        case "DECLINE_ACTION":
            // Handle decline
            break
            
            
        default:
            break
        }
        
        completionHandler()
        
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print ("notification = " + notification.request.content.body)
        
        
        completionHandler(.alert)
    }
    
    
}

