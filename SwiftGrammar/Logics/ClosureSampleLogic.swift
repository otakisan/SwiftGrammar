//
//  ClosureSampleLogic.swift
//  SwiftGrammar
//
//  Created by Takashi Ikeda on 2014/09/07.
//  Copyright (c) 2014年 TI. All rights reserved.
//

import UIKit

class ClosureSampleLogic: NSObject, SampleExecDelegate {
    func execute(arg: AnyObject) -> String {
        
        var curryResult = self.curryFuncSample(self.nestedFuncSample(isMaximum: true))(nums : [1, 2, -1, 90, 88, 67])
        var resultString : String = "curry Result : \(curryResult)"
        
        return "ClosureSampleLogic Done. \n" + resultString
    }
    
    private func tupleReturnFunc() -> (dummyFromIndex : Int, dummyToIndex : Int){
        return (1, 2)
    }
    
    private func externalArgsNameSample(externalDummyName internalName : Int, exName2 inName2 : Int){
        
    }
    
    private func externalArgsNameAbbrSample(#abbrExName1 : Int, abbrExName2 : Int){
        
    }
    
    private func valiableArgsSample(strs : String ...){
        // 可変長引数は配列として扱える
        self.arrayArgSample(strs)
    }
    private func arrayArgSample(strs : [String]){
        
    }
    
    private func valArgSample(var arg1 : String){
        // 関数の引数はデフォルトでletらしい
        // var を付与すると、値を変更できるようになるらしい
    }
    
    private func refArgSample(inout arg1 : String){
        // たぶん、C#でいうref/outあたりと同じはず。
    }
    
    private func grammarSample(){
        
        // for文のワイルドカード指定
        var loopCount : Int = 10
        for _ in 1 ... loopCount{
            print("test")
        }
    }
    
    private func sample(rule : (Int, Int) -> Int, elements : [Int]) -> Int {
        return 0
    }
    
    private func nestedFuncSample(#isMaximum : Bool) -> (Int, Int) -> Int {
        func innerFuncSampleMaximum(a : Int, b : Int) -> Int { return a > b ? a : b }
        func innerFuncSampleMinimum(a : Int, b : Int) -> Int { return a < b ? a : b }
        
        return isMaximum ? innerFuncSampleMaximum : innerFuncSampleMinimum
    }
    
    private func curryFuncSample(rule : (Int, Int) -> Int)(nums : [Int]) -> Int {
        var bound = nums[0]
        for num in nums {
            bound = rule(num, bound)
        }
        
        return bound
    }
}
