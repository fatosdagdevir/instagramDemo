//
//  addPostViewController.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/27/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import UserNotifications

class AddPostViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func postTapped(_ sender: Any) {
        
        /* 1. Get user post data from UI
           2. Save post data to firebase db
           3. Schedule a silent push notification with id to trigger post function
           4. when push is captured query user post with id
           5. call instagram post function
         */
        
        let post : [String: Any] = ["caption": "what a day", "image": "instagram image"]
        let databaseReference = Database.database().reference()
        databaseReference.child("Post").childByAutoId().setValue(post)
        
        let calendar = Calendar.current
        let components = DateComponents(year: 2018, month: 11, day: 28, hour: 20, minute: 22)
        let date = calendar.date(from: components)
        let comp2 = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: date!)
        let trigger = UNCalendarNotificationTrigger(dateMatching: comp2, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = ""
        content.subtitle = ""
        content.body = ""
        content.sound = nil
        
        let request = UNNotificationRequest(
            identifier: "identifier",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                //handle error
                self.dismiss(animated: true, completion: nil)
            } else {
                //notification set up successfully
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
