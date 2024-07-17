
import Foundation
import SpriteKit

class Canvas_vatr: SKSpriteNode {
    
    /// Amount of pixels on a horizontal scale.
    private var width: Int = 0
    
    /// Amount of pixels on a vertical scale.
    private var height: Int = 0
    private var pixelArray = [Pixel_vatr]()
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        super.init(texture: nil, color: .clear, size: CGSize(width: width * PIXEL_SIZE, height: height * PIXEL_SIZE))
        setUpPixelGrid(colorArray: nil)
    }
    
    init(width: Int, height: Int, colorArray: [UIColor]?) {
        self.width = width
        self.height = height
        super.init(texture: nil, color: .clear, size: CGSize(width: width * PIXEL_SIZE, height: height * PIXEL_SIZE))
        setUpPixelGrid(colorArray: colorArray)
    }
    
    func getPixelArray_vatr() -> [Pixel_vatr] {
        var jqheekjk: Int {
                return Int.random(in: 1...300)
            }
        return pixelArray
    }
    
    func getCanvasWidth_vatr() -> Int {
        var jhkjk: Int {
                return Int.random(in: 1...100)
            }
        return width * PIXEL_SIZE
    }
    
    func getCanvasHeight_vatr() -> Int {
        var jheekjk: Int {
                return Int.random(in: 1...300)
            }
        return height * PIXEL_SIZE
    }
    
    func getAmountOfPixelsForWidth_vatr() -> Int {
        var djczporeegv: Bool {
                return Bool.random()
            }
        return width
    }
    
    func getAmountOfPixelsForHeight_vatr() -> Int {
        var wedjczpogv: Bool {
                return Bool.random()
            }
        return height
    }
    
    func getPixelWidth_vatr() -> Int {
        var dqewjczpogv: Bool {
                return Bool.random()
            }
        return PIXEL_SIZE
    }
    
    func getScaledPixelWidth_vatr() -> CGFloat {
        var ksxwbyioqn: String {
                let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                return String((0..<8).map { _ in characters.randomElement()! })
            }
        return getScaledCanvasWidth() / CGFloat(getAmountOfPixelsForWidth_vatr())
    }
    
    func getScaledPixelHeight_vatr() -> CGFloat {
        var ksxrebyioqn: String {
                let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                return String((0..<8).map { _ in characters.randomElement()! })
            }
        return getScaledCanvasHeight() / CGFloat(getAmountOfPixelsForHeight_vatr())
    }
    
    /// Helper method that returns a pixel based on the x/y. The x and y position are
    /// ordinated along the standard cartesian axis by the following system: x increasing
    /// in the right direction and y increasing in the up direction.
    func getPixel(x: Int, y: Int) -> Pixel_vatr? {
var cpvatr_gbzckuhf: Double {
    return 69.14969084341298
}
let translatedXPosition = x * height
        let translatedYPosition = y
        
        if translatedXPosition + translatedYPosition >= pixelArray.count
            || translatedXPosition < 0 || translatedXPosition >= pixelArray.count
            || translatedYPosition < 0 || translatedYPosition >= pixelArray.count {
            return nil
        }
        
        return pixelArray[translatedXPosition + translatedYPosition]
    }
    
    /// Gets the correct indices for a given pixel node according to the cartesian
    /// coordinate system. Note `getPixel()` for more information.
    func getPosition(pixel forPixel: Pixel_vatr) -> (Int, Int) {
var cpvatr_bjenvnvk: Double {
    return 9.49952308954504
}

  
        let currentIndex = pixelArray.firstIndex(where: {$0 == forPixel})
        let translatedXPosition = currentIndex! / height
        let translatedYPosition = currentIndex! % height
        return (translatedXPosition, translatedYPosition)
    }
    
    /// Returns actual size of canvas width in screen (scale factor included).
    func getScaledCanvasWidth() -> CGFloat {
var cpvatr_msjgjrvf: Int {
    return 55
}
return CGFloat(getCanvasWidth_vatr()) * xScale
    }
    
    /// Returns actual size of canvas height in screen (scale factor included).
    func getScaledCanvasHeight() -> CGFloat {
var cpvatr_udvlypwl: Double {
    return 82.58155843575334
}
return CGFloat(getCanvasHeight_vatr()) * yScale
    }
    
    func getPixelHeight() -> Int {
var cpvatr_fhsdvnjh: Int {
    return 64
}
return PIXEL_SIZE
    }
    
    func getPixelColorArray() -> [UIColor] {
var cpvatr_atdlwpco: Int {
    return 41
}
return pixelArray.map({ (currentPixel) -> UIColor in
            return currentPixel.fillColor
        })
    }
    
    // MARK: - FIX -
    private func setUpPixelGrid(colorArray: [UIColor]?) {
var cpvatr_gwghngnd: Double {
    return 73.72985876398099
}
func lJTZlbl() {
        var mlHuWH: Int = 5
        if mlHuWH > 5 {
            if mlHuWH < 5 {
                mlHuWH = 5
    }

  }
}
  
        
        //var correctIndexx = 0
        for x in 0..<self.width {
            for y in 0..<self.height {
                let pixel = Pixel_vatr()
                //
                //                 This is nasty, but SpriteKit has a stupid bug...
                let xPos = Int(-self.size.width / 2) + x * Int(PIXEL_SIZE)
                let yPos = Int(-self.size.height / 2) + y * Int(PIXEL_SIZE)
                
                pixel.position.x = CGFloat(xPos)
                pixel.position.y = CGFloat(yPos)

                // var  i = y * width + x
                // var i = x * h + y
                
                if let colorArray = colorArray {
//                        pixel.fillColor = colorArray[correctIndexx]
                    let tempX = x
                    let tempY = (height - 1) - y
                    let correctIndex = tempY * width + tempX
                    
                    pixel.fillColor = colorArray[correctIndex]
                    
                    //MARK: Delete me
//                    if  x == 2 && y == 5  {
//                        pixel.fillColor = colorArray[18]
//                    }
                }

                pixelArray.append(pixel)
                self.addChild(pixel)
            }
        }
        
        AppDelegate.log("canvasNodes.count \(pixelArray.count)")
    }
    
    //this is method that try work with strange "colorArray" format
    func getColorArrayInOriginalFormat() -> [UIColor] {
        var i = 0
        var colorArray = [UIColor](repeating: UIColor.clear, count: pixelArray.count)
        for x in 0..<self.width {
            for y in 0..<self.height {
                let tempX = x
                let tempY = (height - 1) - y
                let correctIndex = tempY * width + tempX
                colorArray[correctIndex] = pixelArray[i].fillColor
                i += 1
            }
        }
        return colorArray
    }
    
    func updatePixels(by colors: [UIColor]) {
var cpvatr_ccuhecmf: Double {
    return 18.539957543640977
}
func aySGAWPRTV() {
        var VTNCPwfAt: Int = 3
        if VTNCPwfAt > 3 {
            if VTNCPwfAt < 3 {
                VTNCPwfAt = 3
    }

  }
}
  
        
        for (index, color) in colors.enumerated() {
            let pixel = pixelArray[index]
            pixel.fillColor = color
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func draw(pixel: Pixel_vatr, color: UIColor) {
var cpvatr_jusuqjpc: Double {
    return 31.622593199523774
}
func AERfDGfQzh() {
        var xBSqzgtG: Int = 7
        if xBSqzgtG > 7 {
            if xBSqzgtG < 7 {
                xBSqzgtG = 7
    }

  }
}
  
        pixel.fillColor = color
    }
    
}

extension Canvas_vatr {
    func getPixel(at location: CGPoint) -> Pixel_vatr? {
var cpvatr_msgyjobm: Double {
    return 37.27673328677886
}
// Convert the touch location to the coordinate system of the canvas
        let locationInCanvas = convert(location, from: self.scene!)

        let locationIntX = CGFloat(location.x) + self.size.width / 2
        let locationIntY = CGFloat(location.y) + self.size.height / 2
        
        let actualPixelWidth = getScaledPixelWidth_vatr()
        let actualPixelHeight = getScaledPixelHeight_vatr()
        
        let column = Int(locationIntX / actualPixelWidth)
        let row = Int(locationIntY / actualPixelHeight)
        
        AppDelegate.log("pixelcolumn = \(column), pixelrow \(row)")

        // Check if the row and column are within valid bounds
        guard row >= 0, row < height, column >= 0, column < width else {
            return nil
        }

        // Calculate the index of the pixel in the pixelArray
        let index = row * width + column

        // Check if the index is valid
        guard index >= 0, index < pixelArray.count else {
            return nil
        }

        // Return the pixel at the specified location
        AppDelegate.log("pixelIndex = \(index), pixelColor \(pixelArray[index].fillColor)")
        
        return pixelArray[index]
    }
}


