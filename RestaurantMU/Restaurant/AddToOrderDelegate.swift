//
//  AddToOrderDelegate.swift
//  Restaurant
//
//  Created by Mohammed Uddin on 05/19/2021.
//  Copyright © 2021 Mohammed Uddin. All rights reserved.
//
//  Protocol for adding items to the order

protocol AddToOrderDelegate {
    /// Called when menu item is added
    func added(menuItem: MenuItem)
}
