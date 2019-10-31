//
//  Screen2Sample.swift
//  CommunicationTest WatchKit Extension
//
//  Created by Parrot on 2019-10-31.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class Screen2Sample: WKInterfaceController, WCSessionDelegate {
    
    // MARK: Outlets
    // ---------------------

    // 1. Outlet for the image view
    @IBOutlet var pokemonImageView: WKInterfaceImage!
    
    // 2. Outlet for the label
    @IBOutlet var nameLabel: WKInterfaceLabel!
    var pikachuImage : UIImage = UIImage(named: "pikachu")!
        var caterpieImage : UIImage = UIImage(named: "caterpie")!
       var name : String = ""
    
    // MARK: Delegate functions
    // ---------------------
    
    // Default function, required by the WCSessionDelegate on the Watch side
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //@TODO
    }
    
    // MARK: WatchKit Interface Controller Functions
    // ----------------------------------
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        // 1. Check if the watch supports sessions
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        
  }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
            print("WATCH: Got message from Phone")
          
            let messageBody = message["choice"] as! String
        
            if(messageBody == "pokemon"){
                pokemonImageView.setImage(pikachuImage)
            }
            else if(messageBody == "caterpie"){
                pokemonImageView.setImage(caterpieImage)
            }
        }
         
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    // MARK: Actions
    @IBAction func startButtonPressed() {
        print("Start button pressed")
    }
    
    @IBAction func selecturNameBtn() {
        print("select name button pressed")
        let Responses = ["Albert", "mohamad", "janelle"]
            presentTextInputController(withSuggestions:Responses, allowedInputMode: .plain) {
        
                    (results) in
                      if (results != nil && results!.count > 0)
                      
                      {
                       let userResponse = results?.first as? String
                       self.nameLabel.setText(userResponse)
                        self.name = userResponse!
                    }
                }
            }
            override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
                return self.name
        
             }
    }
    
    
    


