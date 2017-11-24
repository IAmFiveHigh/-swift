//
//  ViewController.swift
//  封装CoreImage  摘录来自: Chris Eidhof. “函数式 Swift”。 iBooks.
//
//  Created by 每天农资 on 2017/11/24.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit
import CoreImage

typealias Filter = (CIImage) -> CIImage?

class ViewController: UIViewController {

    func blur(radius: Double) -> Filter {
        
        return { image in
            let params = [kCIInputRadiusKey: radius,
                          kCIInputImageKey: image]
                as [String : Any]
            guard let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: params) else { return nil }
            guard let outPutImage = filter.outputImage else { return nil }
            return outPutImage
        }
    }
    
    func colorGenerator(color: UIColor) -> Filter {
        return { _ in
            let c = CIColor(color: color)
            let params = [kCIInputColorKey: c]
            guard let filter = CIFilter(name: "CIConstantColorGenerator", withInputParameters: params) else { return nil }
            guard let outPutImage = filter.outputImage else { return nil }
            return outPutImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    
}



