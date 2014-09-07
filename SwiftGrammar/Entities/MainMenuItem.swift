//
//  MainMenuItem.swift
//  SwiftGrammar
//
//  Created by Takashi Ikeda on 2014/09/07.
//  Copyright (c) 2014年 TI. All rights reserved.
//

import UIKit

class MainMenuItem: NSObject {
    
    var title : String = ""
    var execViewSegueId : String = ""
    var sampleLogic : SampleExecDelegate = EmptyLogic()
}

class EmptyLogic : SampleExecDelegate{
    func execute(arg: AnyObject) -> String {
        return "No Logic"
    }
}
