//
//  SampleExecBasicViewController.swift
//  SwiftGrammar
//
//  Created by Takashi Ikeda on 2014/09/07.
//  Copyright (c) 2014年 TI. All rights reserved.
//

import UIKit

class SampleExecBasicViewController: UIViewController {
    
    var sampleLogicTitle : String = ""
    var sampleLogic : SampleExecDelegate = EmptyLogic()

    @IBOutlet weak var sampleLogicTitleLabel: UILabel!
    @IBOutlet weak var sampleLogicResultTextView: UITextView!
    
    @IBAction func sampleExecButtonDidTouchUpInside(sender: UIButton) {
        var resultText = sampleLogic.execute([])
        self.sampleLogicResultTextView.text = resultText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeControls()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initializeControls() {
        self.sampleLogicTitleLabel.text = self.sampleLogicTitle
        self.sampleLogicResultTextView.text = ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
