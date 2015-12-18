//
//  EnterPin.swift

import WatchKit
import Foundation

class EnterPin: WKInterfaceController {

    //MARK: - IBOutlets
    
    @IBOutlet var lblPin: WKInterfaceLabel!
    
    
    //MARK: - Variables
    
    var timerToResetColor : NSTimer?
    var timerToHide : NSTimer?

    var correctPin : String? = "1234";
    
    var strUserPin: String = "" {
        
        didSet {
            
            if(timerToHide != nil){
                if(timerToHide?.valid == true){
                    timerToHide?.invalidate()
                }
            }
            
            timerToHide = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: "hideAllCharacter", userInfo: nil, repeats: false);
            
            
            let l = strUserPin.lengthOfBytesUsingEncoding(NSUTF8StringEncoding);
            let str = strUserPin as NSString;
            var pin = "";
            
            for var i = 0 ; i < l - 1 ; i++ {
                pin = "\(pin) *"
            }
            
            var index : Int = 0;
            index = l
            if(l > 0){

                let a = str.asciiValue(UInt32(index-1))
                let s = String(UnicodeScalar(a))
                pin = "\(pin) \(s)"
            }
            
            for var i = l ; i < 4 ; i++ {
                pin = "\(pin) -"
            }
            
            lblPin.setText(pin);
            
        }
    }
    
    //MARK: - WKInterfaceController Methods
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        
        if(timerToResetColor != nil){
            if(timerToResetColor!.valid){
                timerToResetColor!.invalidate()
            }
        }
        
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    //MARK: - IBAction Methods
    
    @IBAction func keypadeClicked1() {
        self.userClicked("1");
    }

    @IBAction func keypadeClicked2() {
        self.userClicked("2");
        
    }
    
    @IBAction func keypadeClicked3() {
        self.userClicked("3");
    }
    
    @IBAction func keypadeClicked4() {
        self.userClicked("4");
    }
    
    @IBAction func keypadeClicked5() {
        self.userClicked("5");
    }
    
    @IBAction func keypadeClicked6() {
        self.userClicked("6");
    }
    
    @IBAction func keypadeClicked7() {
        self.userClicked("7");
    }
    
    @IBAction func keypadeClicked8() {
        self.userClicked("8");
    }
    
    @IBAction func keypadeClicked9() {
        self.userClicked("9");
    }
    
    @IBAction func keypadeClicked0() {
        self.userClicked("0");
    }
    
    @IBAction func keypadeClickedReset() {

        if(timerToResetColor != nil){
            if(timerToResetColor!.valid){
                timerToResetColor!.invalidate()
            }
        }
        
        strUserPin = "";
        lblPin.setTextColor(UIColor.whiteColor());

    }

    @IBAction func keypadeClickedBackSpace() {
        let length = strUserPin.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        if(length >= 1){
            
            let index1 = strUserPin.endIndex.advancedBy(-1)
            strUserPin = strUserPin.substringToIndex(index1)
        }
    }
    
    //MARK: - Helper Methods
    
    func userClicked(strKey :String){
        
        if(strUserPin.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 4){
            strUserPin = "\(strUserPin)\(strKey)"
        }

        if(strUserPin.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == 4){
            NSLog("Check for Pin");
            
            if (strUserPin == correctPin){
                
                dismissController()
               
            }
            else{
                
                lblPin.setTextColor(UIColor.redColor());
                timerToResetColor = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "resetColor", userInfo: nil, repeats: false);
            }
        }
    }
    
    func resetColor(){
        
        strUserPin = "";
        
        lblPin.setTextColor(UIColor.whiteColor());
    }
    
    
    func hideAllCharacter(){
        
        let l = strUserPin.lengthOfBytesUsingEncoding(NSUTF8StringEncoding);
        var pin = "";
        
        for var i = 0 ; i < l; i++ {
            pin = "\(pin) *"
        }
        
        for var i = l ; i < 4 ; i++ {
            pin = "\(pin) -"
        }
        
        lblPin.setText(pin);
        
    }
    
}
