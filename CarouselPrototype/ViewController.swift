//
//  ViewController.swift
//  CarouselPrototype
//
//  Created by Nan Chen on 5/12/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tile1Image: UIImageView!
    @IBOutlet weak var tile2Image: UIImageView!
    @IBOutlet weak var tile3Image: UIImageView!
    @IBOutlet weak var tile4Image: UIImageView!
    @IBOutlet weak var tile6Image: UIImageView!
    @IBOutlet weak var tile5Image: UIImageView!
    
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
        
    var xOffsets: [Float] = [-30, -75, -66, -10, -200, -15]
    var yOffsets: [Float] = [-285, -240, -415, -408, -480, -500]
    var scales: [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations: [Float] = [-10, -10, -10, 10, 10, -10]
    
    var initialCenter: CGPoint!
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) ->
        Float {
            var ratio = (r2Max - r2Min) / (r1Max - r1Min)
            return value * ratio + r2Min - r1Min * ratio
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        
        tile1Image.center = CGPointMake(-30, -285)
        tile2Image.center = CGPointMake(-75, -240)
        tile3Image.center = CGPointMake(66, 415)
        initialCenter = tile3Image.center
        println(initialCenter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(introScrollView.contentOffset.y)
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile1Image.transform = CGAffineTransformScale(tile1Image.transform, CGFloat(scale), CGFloat(scale))
        tile1Image.transform = CGAffineTransformRotate(tile1Image.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        var tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -75, r2Max: 0)
        var ty2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        var scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile2Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        tile2Image.transform = CGAffineTransformScale(tile2Image.transform, CGFloat(scale2), CGFloat(scale2))
        tile2Image.transform = CGAffineTransformRotate(tile2Image.transform, CGFloat(Double(rotation2) * M_PI / 180))

        var tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -66, r2Max: 0)
        var ty3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        var scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        var rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile3Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        tile3Image.transform = CGAffineTransformScale(tile3Image.transform, CGFloat(scale3), CGFloat(scale3))
        tile3Image.transform = CGAffineTransformRotate(tile3Image.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
        var tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        var ty4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        var scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        var rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile4Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        tile4Image.transform = CGAffineTransformScale(tile4Image.transform, CGFloat(scale4), CGFloat(scale4))
        tile4Image.transform = CGAffineTransformRotate(tile4Image.transform, CGFloat(Double(rotation4) * M_PI / 180))
        
        var tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -200, r2Max: 0)
        var ty5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -480, r2Max: 0)
        var scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile5Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        tile5Image.transform = CGAffineTransformScale(tile5Image.transform, CGFloat(scale5), CGFloat(scale5))
        tile5Image.transform = CGAffineTransformRotate(tile5Image.transform, CGFloat(Double(rotation5) * M_PI / 180))
        
        var tx6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -15, r2Max: 0)
        var ty6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        var scale6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile6Image.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        tile6Image.transform = CGAffineTransformScale(tile6Image.transform, CGFloat(scale6), CGFloat(scale6))
        tile6Image.transform = CGAffineTransformRotate(tile6Image.transform, CGFloat(Double(rotation6) * M_PI / 180))
        
        println("content offset: \(introScrollView.contentOffset.y)")
        println(tile1Image.center)
    }
    
    
}

