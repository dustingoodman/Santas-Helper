//
//  UPCScannerViewController.swift
//  SantasHelper
//
//  Created by Dustin Goodman on 10/4/16.
//  Copyright © 2016 Dustin Goodman. All rights reserved.
//

import UIKit
import AVFoundation

protocol BarcodeDelegate {
    func barcodeReaded(barcode: String)
}

class UPCScannerViewController: UIViewController , AVCaptureMetadataOutputObjectsDelegate {

    var delegate: BarcodeDelegate?
    var captureSession: AVCaptureSession!
    var code: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.captureSession = AVCaptureSession();
        
        let videoCaptureDevice: AVCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        do {
            
            let videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            
            if self.captureSession.canAddInput(videoInput) {
                self.captureSession.addInput(videoInput)
            } else {
                print("Could not add video input")
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            if self.captureSession.canAddOutput(metadataOutput) {
                self.captureSession.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
                metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeEAN13Code]
            } else {
                print("Could not add metadata output")
            }
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
            previewLayer.frame = self.view.layer.bounds
            self.view.layer .addSublayer(previewLayer)
            self.captureSession.startRunning()
        } catch let error as NSError {
            print("Error while creating vide input device: \(error.localizedDescription)")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        for metadata in metadataObjects {
            let readableObject = metadata as! AVMetadataMachineReadableCodeObject
            code = (readableObject.stringValue)!
            if code!.isEmpty {
            }else{
                self.captureSession.stopRunning()
                //self.dismissViewControllerAnimated(true, completion: nil)
                performSegueWithIdentifier("addToBagSegue", sender: nil)
                self.delegate?.barcodeReaded(code!)
                print(code!)
            }
        }
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addToBagSegue" {
            
            let destinationViewController = segue.destinationViewController as! UINavigationController
            let addEventViewController = destinationViewController.topViewController as! AddToBagViewController
            
            addEventViewController.upcCode = code!

            
        }
        
        
                //_ = destinationViewController.topViewController as! AddToBagViewController

        
        //let destinationViewController = segue.destinationViewController as! AddToBagViewController
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
