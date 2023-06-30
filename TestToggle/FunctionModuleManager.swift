//
//  FunctionModuleManager.swift
//  TestToggle
//
//  Created by black2w on 2023/6/29.
//

import Foundation

class FunctionModuleManager {
    static let sharedInstance = FunctionModuleManager()
    
    //完整功能列表，根据配置来的(外部赋值、内部查询)
    var remoteModules: Array<EXItemModel>? = Array()
    var remoteDic: Dictionary<String, Any>? = Dictionary()
    
    
    //项目中已有的功能模块，本地已添加的业务
    var localModules: Array<FunctionModule>? = Array()
    var localDic: Dictionary<String, Any>? = Dictionary()
    
    //构建功能对象，构建在本地（根据类名动态Load?）
    func loadAllModules() -> Void {
        let module1 = Function1()
        module1.identify = "function 1"
        module1.isToggle = false
        module1.defaultSettings()
        self.localModules?.append(module1)
        self.localDic?[module1.identify] = module1
        
        let module2 = Function2()
        module2.identify = "function 2"
        module2.isToggle = false
        module2.defaultSettings()
        self.localModules?.append(module2)
        self.localDic?[module2.identify] = module2

        let module3 = Function3()
        module3.identify = "function 3"
        module3.isToggle = false
        module3.defaultSettings()
        self.localModules?.append(module3)
        self.localDic?[module3.identify] = module3

    }
    
    //更新功能开关相关的
    func mergeFunctions() -> Void {
        for module in self.localModules! {
            if let remoteModel = self.remoteDic?[module.identify] as? EXItemModel {
                //有查询到，根据配置更新本地开关
                module.isToggle = remoteModel.toggle!
            } else {
                //默认关
                module.isToggle = false
            }
            
            module.statusIsChanged()
        }
        
        
    }
    
    //查询功能列表，内部赋值
    func queryFunctionConfig() -> Void {
        for i in 1...10 {
            let itmeModel = EXItemModel()
            itmeModel.id = i
            itmeModel.name = "function " + "\(i)"
            itmeModel.toggle = i%2==0 ? true : false
            itmeModel.desc = "function desc \(i)"
            
            remoteModules?.append(itmeModel)
            remoteDic?[itmeModel.name!] = itmeModel
        }
        
        self.mergeFunctions()
    }
    
    //功能变更，外部更新
    func updateFunctionConfig(model: EXItemModel) -> Void {
        if let itemModel = self.remoteDic?[model.name!] {
            //当前已有，则更新
            self.remoteModules?.remove(itemModel as! EXItemModel)
            self.remoteDic?[model.name!] = model
            self.remoteModules?.append(model)
            
        } else {
            //当前无，则新增
            self.remoteModules?.append(model)
            self.remoteDic?[model.name!] = model
        }
        
        //本地
        if let lModel = self.localDic?[model.name!] as? FunctionModule {
            lModel.isToggle = model.toggle!
            
            lModel.statusIsChanged()
        }
        
//        self.mergeFunctions()

    }
}


extension Array where Element: Equatable {
    mutating func remove(_ object: Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
}
