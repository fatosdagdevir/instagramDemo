//
//  UITableView.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import UIKit

extension UITableView {
    
    func deque<C: UITableViewCell>() -> C {
        guard let cell = self.dequeueReusableCell(withIdentifier: C.className) as? C
            else { fatalError("could not deque cell with identifier \(C.className) from tableView \(self)") }
        return cell
    }
    
    func deque<C: UITableViewCell>(at indexPath: IndexPath) -> C {
        guard let cell = self.dequeueReusableCell(withIdentifier: C.className, for: indexPath) as? C
            else { fatalError("could not deque cell with identifier \(C.className) from tableView \(self)") }
        return cell
    }
    
    func registerNib(withIdentifier identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}

