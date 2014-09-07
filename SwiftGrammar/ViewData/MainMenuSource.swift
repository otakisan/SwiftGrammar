//
//  MainMenuSource.swift
//  SwiftGrammar
//
//  Created by Takashi Ikeda on 2014/09/07.
//  Copyright (c) 2014年 TI. All rights reserved.
//

import UIKit

class MainMenuSource: NSObject {
    
    let sampleExecBasicSegueId = "showSampleExecBasicSegue"
    
    func createMainMenuItems() -> [MainMenuItem] {
        
        var menuItems : [MainMenuItem] = [
            //MainMenuItem(){ title = "" }
        ]
        
        var item = MainMenuItem()
        item.title = "Closure"
        item.execViewSegueId = sampleExecBasicSegueId
        item.sampleLogic = ClosureSampleLogic()
        
        menuItems.append(item)
        
        return menuItems
    }
}
