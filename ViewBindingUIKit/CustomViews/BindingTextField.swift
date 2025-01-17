//
//  BindingTextField.swift
//  ViewBindingUIKit
//
//  Created by Christian Santiago Vera Rojas on 31/10/24.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChanged: (String) -> Void = {_ in}
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        
        addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    func bind(callback: @escaping (String) -> Void){
        textChanged = callback
    }
    
    @objc func textFieldDidChanged(_ textfield: UITextField){
        
        if let text = textfield.text {
            textChanged(text)
        }
        
        
    }
    
}
