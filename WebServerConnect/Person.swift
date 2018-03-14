//
//  Person.swift
//  WebServerConnect
//
//  Created by 元木嵩人 on 2018/03/14.
//  Copyright © 2018年 元木嵩人. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PersonModel: NSObject, UITableViewDataSource {
    private var people: [Person] = []
    private var json: JSON!
    
    // MARK: - Send a HTTP Request
    func sendHTTPRequest(url: String) {
        let listUrl = "http://\(url):8080"
        Alamofire.request(listUrl).responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            self.json = JSON(object)
        }
    }
    
    // MARK: - Parse JSON File
    func parseJSON() {
        if json != nil {
            json.forEach{ (_, data) in
                var person = Person(Id: 0, Name: "", Age: -1)
                person.Id = data["id"].int!
                person.Name = data["name"].string!
                person.Age = data["age"].int!
                self.people.append(person)
            }
        }
        print(people)
    }
    
    // MARK: - Reset Data
    func reset() {
        people = []
    }
    
    // MARK: - TableViewDataSource Required Methods Start
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(people.count)
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
        if people.count != 0 {
            cell.textLabel?.text = people[indexPath.row].Name
            cell.detailTextLabel?.text = "Age: \(people[indexPath.row].Age)"
        }
        return cell
    }
    // MARK: - TableViewDataSource Required Methods End
}

struct Person {
    var Id: Int
    var Name: String
    var Age: Int
}
