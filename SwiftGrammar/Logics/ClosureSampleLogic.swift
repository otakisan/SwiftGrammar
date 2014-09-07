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
        
        var resultItems : [AnyObject] = []
        
        var curryResult = self.curryFuncSample(self.nestedFuncSample(isMaximum: true))(nums : [1, 2, -1, 90, 88, 67])
        var resultString : String = "curry Result : \(curryResult)"
        resultItems.append(resultString)
        
        // 関数を指定
        var resultClosure = self.filteredNum([9, 1, 32, 44, 4], cond: self.overTen)
        resultItems.append("resultClosure:\(resultClosure)")
        
        // 直接クロージャを記述
        var resultClosure2 = self.filteredNum([1, 99, 41, 10, 33], cond: {(a : Int) -> Bool in a > 10})
        resultItems.append("resultClosure2:\(resultClosure2)")
        
        // 引数及び戻り値の型を省略（型推論）
        var resultClosure3 = self.filteredNum([33, 44, 9, 10], cond: {a in a > 10})
        resultItems.append("resultClosure3:\(resultClosure3)")
        
        // さらに省略
        var resultClosure4 = self.filteredNum([33, 44, 9, 10], cond: {$0 > 10})
        resultItems.append("resultClosure4:\(resultClosure4)")
        
        // 末尾クロージャ式
        var resultClosure5 = self.filteredNum([33, 44, 9, 10]){$0 > 10}
        resultItems.append("resultClosure5:\(resultClosure5)")
        
        // @autoclosure属性 引数を取らず値のみ返却する場合は、{}を省略できる
        var resultAutoClosure = self.lazyAnd(1 < 3, rhs: 2 < 3)
        resultItems.append("resultAutoClosure:\(resultAutoClosure)")
        
        var traceOutString = ""
        for resultItem in resultItems{
            traceOutString += resultItem.description + "\n"
        }
        
        return "ClosureSampleLogic Done. \n" + traceOutString
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
    
    private func filteredNum(nums : [Int], cond : (Int) -> Bool) -> [Int] {
        var filteredNums : [Int] = []
        for num in nums {
            if cond(num) {
                filteredNums.append(num)
            }
        }
        
        return filteredNums
    }
    
    private func overTen(a : Int) -> Bool {
        return a > 10
    }
    
    private func lazyAnd(lhs : Bool, rhs : @autoclosure () -> Bool) -> Bool {
        if lhs {
            return rhs()
        }
        return lhs
    }
}
