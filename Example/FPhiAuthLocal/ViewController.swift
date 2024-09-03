//
//  ViewController.swift
//  FPhiAuthLocal
//
//  Created by LAguirreE on 09/02/2024.
//  Copyright (c) 2024 LAguirreE. All rights reserved.
//

import UIKit
import FPhiWidgetSelphi
import os.log

class ViewController: UIViewController {
    // MARK: - Variables
    var selphiWidget: SelphiWidget?
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var captureButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Selphi"))
        //self.captureButton.addRoundCorners(roundness:30)
        //self.captureButton.setTitle("capture_text".localized, for: .normal)
        //self.previewImage.addRoundCorners(roundness:15)
    }
    
    // MARK: - Capture Action
    @IBAction func initCapture(_ sender: Any) {
        
        //WARNING: - Type correctly the resource you pretend to use.
        guard let resource = Bundle.main.path(forResource: "fphi-selphi-widget-resources-selphi-live-1.2", ofType: "zip") else {
            //let alert = UIAlertController(title: "path_text".localized, message: "check_zip_text".localized, preferredStyle: .alert)
            //let alertAction = UIAlertAction(title: "ok_text".localized, style: .cancel, handler: nil)
            //alert.addAction(alertAction)
            //self.present(alert, animated: false)
            return
        }

        do {
            try selphiWidget = SelphiWidget(frontCameraIfAvailable: true, resources: resource, delegate: self)
        } catch {
            
        }
        guard let widget = selphiWidget else { return }
        
        // Add here all configuration options
        widget.livenessMode = .LMLivenessPassive

        
        
        // Launching widget
        widget.startExtraction()
        present(widget, animated: true)
    }

}

   // MARK: - Widget delegate methods
extension ViewController: FPhiWidgetProtocol {
        
    func extractionFinished() {
        os_log("[Extractor] - %s", log: .default, type: .debug, "Extraction finished")

        // Get extractor result
        guard let results = self.selphiWidget?.results else { return }
        guard let record = results.bestImage else { return }

        // Get image
        guard let image = record.image else { return }
        previewImage.image = image
    }

    func extractionFailed(_ error: Error!) {
        os_log("[Extractor] - %s", log: .default, type: .debug, "Extraction failed: \(error.debugDescription)")
    }

    func extractionCancelled() {
        os_log("[Extractor] - %s", log: .default, type: .debug, "Extraction cancelled")
    }

    func extractionTimeout() {
        os_log("[Extractor] - %s", log: .default, type: .debug, "Extraction timeout")
    }
    
    func onEvent(_ time: Date!, type: String!, info: String!) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        os_log("[On Event] - %s", log: .default, type: .debug, "On Event: time:\(formatter.string(from: time)), type:\(type ?? ""), info:\(info ?? "")")
    }
    
}

