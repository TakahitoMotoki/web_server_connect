//
//  View.swift
//  WebServerConnect
//
//  Created by 元木嵩人 on 2018/03/14.
//  Copyright © 2018年 元木嵩人. All rights reserved.
//

import UIKit

class PersonView: UIView {
    var urlTextFields: UITextField
    var sendAPIButton: UIButton
    var personTableView: UITableView
    let NATIVE_BOUND_SIZE = UIScreen.main.bounds.size
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    required init(model: PersonModel) {
        urlTextFields = UITextField()
        sendAPIButton = UIButton()
        personTableView = UITableView(frame: CGRect(x: 0, y: 200, width: NATIVE_BOUND_SIZE.width , height: NATIVE_BOUND_SIZE.height - 200), style: .plain)
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        // MARK: - urlTextFields Start
        urlTextFields.backgroundColor = UIColor.white
        urlTextFields.placeholder = "Type API URL"
        urlTextFields.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(urlTextFields)
        
        urlTextFields.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: NATIVE_BOUND_SIZE.width * 0.1).isActive = true
        urlTextFields.topAnchor.constraint(equalTo: self.topAnchor, constant: 66.0).isActive = true
        urlTextFields.widthAnchor.constraint(equalToConstant: NATIVE_BOUND_SIZE.width * 0.8).isActive = true
        urlTextFields.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        // MARK: - urlTextFields End
        
        // MARK: - sendAPIButton Start
        sendAPIButton.setTitle("Get Data", for: .normal)
        sendAPIButton.titleLabel?.textAlignment = .center
        sendAPIButton.backgroundColor = UIColor.brown
        sendAPIButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sendAPIButton)
        
        sendAPIButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: NATIVE_BOUND_SIZE.width * 0.1).isActive = true
        sendAPIButton.topAnchor.constraint(equalTo: urlTextFields.bottomAnchor, constant: 22.0).isActive = true
        sendAPIButton.widthAnchor.constraint(equalToConstant: NATIVE_BOUND_SIZE.width * 0.8).isActive = true
        sendAPIButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        // MARK: - sendAPIButton End
        
        // MARK: - personTableView Start
        self.addSubview(personTableView)
        // MARK: - personTableView End
    }
}
