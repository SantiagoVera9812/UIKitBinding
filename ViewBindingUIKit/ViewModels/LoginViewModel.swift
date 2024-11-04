//
//  LoginViewModel.swift
//  ViewBindingUIKit
//
//  Created by Christian Santiago Vera Rojas on 31/10/24.
//

import Foundation

class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        
        didSet {
            listener?(value)
        }
    }
    
    func bind(callback: @escaping (T) -> Void){
        self.listener = callback
    }
    
    init(_ value: T){
        self.value = value
    }
}

struct LoginViewModel{
    
    var username = Dynamic("")
    var password = Dynamic("")
    
    
}
