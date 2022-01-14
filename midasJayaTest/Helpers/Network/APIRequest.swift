//
//  APIRequest.swift
//  midasJayaTest
//
//  Created by Jehnsen Hirena Kane on 14/01/22.
//

import Foundation

class APIRequest: NSObject {
    
    static func fetchData(successCompletion: @escaping (Any) -> Void,
                          failCompletion: @escaping (String) -> Void) {
        BaseRequest.GET(url: "https://jsonplaceholder.typicode.com/photos") { response in
        
            var dataModel = DataManager.normalUserData

            do {
                let json = try JSONSerialization.jsonObject(with: (response as? Data)!, options: .mutableContainers) as! NSArray

                for item in json {
                    let newData = item as! NSMutableDictionary
                    dataModel.append(APIDataModel(albumId: newData["albumId"] as! Int,
                                                  id: newData["id"] as! Int,
                                                  title: newData["title"] as! String ,
                                                  url: newData["url"] as! String ,
                                                  thumbnailUrl: newData["thumbnailUrl"] as! String))
                    
                }
                successCompletion(dataModel)
            } catch let error {
                failCompletion(error.localizedDescription)
            }
        }
    }
}
