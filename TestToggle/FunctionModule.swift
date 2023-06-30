//
//  FunctionModule.swift
//  TestToggle
//
//  Created by black2w on 2023/6/29.
//

import Foundation

class FunctionModule: FunctionModuleProtocol {
    var identify: String = "function name"
    
    var isToggle: Bool = false
    
    func statusIsChanged() {
        print("statusIsChanged")
        self.updateUI()
        self.updateBusiness()
    }
    
    func defaultSettings() -> Void {
        print("defaultSettings")
    }
    //
    func updateUI() -> Void {
        print("updateUI")
    }
    
    func updateBusiness() -> Void {
        print("updateBusiness")
    }
}
