//
//  SampleExecDelegate.swift
//  SwiftGrammar
//
//  Created by Takashi Ikeda on 2014/09/07.
//  Copyright (c) 2014年 TI. All rights reserved.
//

import Foundation

protocol SampleExecDelegate{
    func execute(arg : AnyObject) -> String
}