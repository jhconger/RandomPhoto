//
//  Canvas.swift
//  RandomPhoto
//
//  Created by justin conger on 9/11/22.
//

import UIKit

class Canvas: UIView {
    override func draw(_ rect:CGRect) {
        //custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else
        {return}
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(8)
        context.setLineCap(.round)
        
        lines.forEach{ (line) in
            for(i,p) in line.enumerated(){
                if i==0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        context.strokePath()
    
    }
//commenting out this code to make many vs single line
//    var line = [CGPoint]()
     
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    //track touhces
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil ) else
        { return }
        
        print (point)
        
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
         
        lines.append(lastLine)
//        var lastLine = lines.last
//        lastLine?.append(point)
        
        setNeedsDisplay()
        
}
}
