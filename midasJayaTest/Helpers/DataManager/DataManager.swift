//
//  DataManager.swift
//  midasJayaTest
//
//  Created by Jehnsen Hirena Kane on 14/01/22.
//

import Foundation
struct DataManager {
    static var normalUserData = [APIDataModel]()
    static var emailUserData : [String : UserData] = ["hirena98@gmail.com" : UserData(id: 1,
                                                                                      username: "Jehnsen",
                                                                                      role: "normal user",
                                                                                      password: "12345"),
                                                      "hirena99@gmail.com": UserData(id: 2,
                                                                                     username: "Kane",
                                                                                     role: "admin",
                                                                                     password: "12345")]
}
