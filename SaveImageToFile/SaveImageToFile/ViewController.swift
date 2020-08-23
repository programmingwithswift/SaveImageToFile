//
//  ViewController.swift
//  SaveImageToFile
//
//  Created by ProgrammingWithSwift on 2020/08/22.
//  Copyright © 2020 ProgrammingWithSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = UIImage(named: "exampleImage") {
            self.savePng(image)
            self.saveJpg(image)
        }
        
        self.readImage()
    }
    
    func documentDirectoryPath() -> URL? {
        let path = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)
        return path.first
    }
    
    func savePng(_ image: UIImage) {
        if let pngData = image.pngData(),
            let path = documentDirectoryPath()?.appendingPathComponent("examplePng.png") {
            try? pngData.write(to: path)
        }
    }
    
    func saveJpg(_ image: UIImage) {
        if let jpgData = image.jpegData(compressionQuality: 0.5),
            let path = documentDirectoryPath()?.appendingPathComponent("exampleJpg.jpg") {
            try? jpgData.write(to: path)
        }
    }
    
    func readImage() {
        if let path = documentDirectoryPath() {
            let pngImageURL = path.appendingPathComponent("examplePng.png")
            let jpgImageURL = path.appendingPathComponent("exampleJpg.jpg")
            
            let pngImage = FileManager.default.contents(atPath: pngImageURL.path)
            let jpgImage = FileManager.default.contents(atPath: jpgImageURL.path)
            
            print(pngImage)
            print(jpgImage)
        }
    }
}

