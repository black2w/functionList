//
//  FunctionModuleProtocol.swift
//  TestToggle
//
//  Created by black2w on 2023/6/29.
//

import Foundation

protocol FunctionModuleProtocol {
    //功能名
    var identify: String {get}
    //功能是否打开
    var isToggle: Bool {get}
    //功能变化回调，后面可以扩展参数这些
    func statusIsChanged() -> Void
}

extension FunctionModuleProtocol {
   
}
