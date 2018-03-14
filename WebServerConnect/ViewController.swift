//
//  ViewController.swift
//  WebServerConnect
//
//  Created by 元木嵩人 on 2018/03/14.
//  Copyright © 2018年 元木嵩人. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    let personmodel: PersonModel = PersonModel()
    var myview: PersonView!

    override func loadView() {
        self.view = PersonView(model: personmodel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myview = self.view as! PersonView
        myview.personTableView.delegate = self
        myview.personTableView.dataSource = personmodel
        myview.personTableView.rowHeight = 56.0
        
        // loginView.loginButton.addTarget(self, action: #selector(LoginViewController.login(sender: )), for: .touchUpInside)
        myview.sendAPIButton.addTarget(self, action: #selector(ViewController.sendRequest(sender: )), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc private func sendRequest(sender: Any!) {
        personmodel.reset()
        personmodel.sendHTTPRequest(url: myview.urlTextFields.text!)
        personmodel.parseJSON()
        myview.personTableView.reloadData()
    }
}

