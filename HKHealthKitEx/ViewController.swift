//
//  ViewController.swift
//  HKHealthKitEx
//
//  Created by EkambaramE on 11/04/16.
//  Copyright © 2016 EkambaramE. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    var healthKit = HKHealthStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestForReadAndShareButton(sender: AnyObject) {
        
        let healthKitTypesToRead = Set(
            arrayLiteral: HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!,
            HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex)!,
            HKObjectType.workoutType()
        )
        
        let healthKitTypesToWrite = Set(arrayLiteral:
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMassIndex)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!,
            HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning)!,
            HKQuantityType.workoutType()
            )
        
        let newCompletion: ((Bool, NSError?) -> Void) = {
            (success, error) -> Void in
            
            if !success {
                print("You didn't allow HealthKit to access these write data types.\nThe error was:\n \(error!.description).")
                
                return
            }
        }
        
        healthKit.requestAuthorizationToShareTypes(healthKitTypesToWrite, readTypes: healthKitTypesToRead, completion: newCompletion)
    }

}

