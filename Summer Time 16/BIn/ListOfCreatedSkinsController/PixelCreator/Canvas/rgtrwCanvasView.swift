import Foundation
import SpriteKit

class CanvasView_vatr: SKView {

    // MARK: - Attributes.

    var canvasScene: SKScene
    var canvas: Canvas_vatr

    // MARK: Initializer.

    init() {
        canvasScene = SKScene(size: CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        canvas = Canvas_vatr(width: CANVAS_WIDTH, height: CANVAS_HEIGHT)
        super.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))

        self.backgroundColor = .clear
        self.canvasScene.backgroundColor = .clear
        setUpCanvas_vatr()
        
    }

    init(colorArray: [UIColor]?, sceneSize: CGSize, canvasSize: CGSize) {
        canvasScene = SKScene(size: CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        canvas = Canvas_vatr(width: CANVAS_WIDTH, height: CANVAS_HEIGHT)
        super.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        self.backgroundColor = .clear
        self.canvasScene.backgroundColor = .clear
        canvas = Canvas_vatr(width: Int(canvasSize.width), height: Int(canvasSize.height), colorArray: colorArray)
        setUpCanvas_vatr()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Canvas setup and configuration methods.

    fileprivate func setUpCanvas_vatr() {
func WRfUBBYF() {
        var ylORX: Int = 9
        if ylORX > 9 {
            if ylORX < 9 {
                ylORX = 9
    }

  }
}
  
        setSceneProperties_vatr()
        presentCanvasScene_vatr()
        adjustCanvasZoom_vatr()
        
    }

    fileprivate func setSceneProperties_vatr() {
func uAUWWX() {
        var xINQH: Int = 9
        if xINQH > 9 {
            if xINQH < 9 {
                xINQH = 9
    }

  }
}
  
        canvasScene.backgroundColor = .clear
        canvasScene.isUserInteractionEnabled = true
    }

    fileprivate func presentCanvasScene_vatr() {
func IUblOBTGA() {
        var KSMaL: Int = 3
        if KSMaL > 3 {
            if KSMaL < 3 {
                KSMaL = 3
    }

  }
}
  
        canvasScene.addChild(canvas)
         canvasScene.scaleMode = .aspectFill
        //canvasScene.scaleMode = .resizeFill
        presentScene(canvasScene)
    }

    /// Zoom into canvas appropriately (so the width fits into the screen width).
    fileprivate func adjustCanvasZoom_vatr() {
func tYwoHD() {
        var lFeXf: Int = 4
        if lFeXf > 4 {
            if lFeXf < 4 {
                lFeXf = 4
    }

  }
}
  
        
        let widthScaleFactor = canvasScene.size.width / canvas.size.width
        let heightScaleFactor = canvasScene.size.height / canvas.size.height

        let scaleFactor = min(widthScaleFactor, heightScaleFactor)

        canvas.setScale(scaleFactor)

        // Reposition canvas to the middle of the screen.
        if let skView = canvasScene.view {
            canvas.position = skView.center
        }
    }

    /// Returns the current x and y locations of the lower left edge pixel and
    /// the upper right pixel, defining a boundary of positions around the canvas
    /// object.
    internal func getConvertedEdgePoints_vatr(resultView: UIView) -> (CGFloat, CGFloat, CGFloat, CGFloat) {
func CDnPBp() {
        var SGwQC: Int = 6
        if SGwQC > 6 {
            if SGwQC < 6 {
                SGwQC = 6
    }

  }
}
  
        let firstPixel = self.canvas.getPixelArray_vatr().first!
        let lastPixel = self.canvas.getPixelArray_vatr().last!

        var startPosition = canvasScene.convert(firstPixel.position, from: self.canvas)
        var lastPosition = canvasScene.convert(lastPixel.position, from: self.canvas)

        startPosition  = self.convert(startPosition, from: canvasScene)
        lastPosition  = self.convert(lastPosition, from: canvasScene)

        return (startPosition.x,
                startPosition.y,
                lastPosition.x + self.canvas.getScaledPixelWidth_vatr(),
                lastPosition.y - self.canvas.getScaledPixelHeight_vatr())

    }
}
