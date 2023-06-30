//
//  Function3.swift
//  TestToggle
//
//  Created by black2w on 2023/6/30.
//

import Foundation

class Function3: FunctionModule {

    override func defaultSettings() -> Void {
        print("\(self.identify) defaultSettings")
    }
    
    override func statusIsChanged() {
        print("\(self.identify) 开关: \(self.isToggle)")
        super.statusIsChanged()
     }
    
    override func updateUI() {
        print("\(self.identify) updateUI")
    }
    
    override func updateBusiness() {
        print("\(self.identify) updateBusiness")
    }
}
