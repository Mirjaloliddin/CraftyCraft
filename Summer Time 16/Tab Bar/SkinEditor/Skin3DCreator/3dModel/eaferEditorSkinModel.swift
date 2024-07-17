

import Foundation
import UIKit
import SceneKit

enum BrashSize_gfdg: Int, CaseIterable {
    case one = 1
    case two = 2
    case four = 4
    case six = 6
    case eight = 8
    case nine = 9
}

enum ToolBar3DSelectedItem_vfgdf {
    case pencil
    case eraser
    case brash
    case fill
    case noise
    case undo
}


class EditorSkinModel_gfghf {
    private(set) weak var controller: Skin3DTestViewController_vatr!
    
    private(set) var magnifyingGlassView: MagnifyingGlassView_vatr?
    lazy var currentDrawingColor: UIColor = controller.colorManager3D.getColor_vatr2(by: 0) {
        didSet {
            controller.colorManager3D.updateColorsArr_vatr2(with: currentDrawingColor)
        }
    }
    
    var brashSize: BrashSize_gfdg = .one
    
    private(set) var assemblyDiagramSize: SkinAssemblyDiagramSize_vatr = .size64x64
    private(set) var skinCreatedModel: SkinCreatedModel_vatr?
    
    private var colorlForSideNodes: [String:[UIColor]] = [CubicHuman_tghty.BodyPart_vhgd.head.top.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.head.bottom.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.head.front.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.head.back.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.head.right.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.head.left.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.body.top.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.body.bottom.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.body.front.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.body.back.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.body.right.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.body.left.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightArm.top.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightArm.bottom.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightArm.front.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightArm.back.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightArm.right.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightArm.left.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftArm.top.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftArm.bottom.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftArm.front.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftArm.back.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftArm.right.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftArm.left.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightLeg.top.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightLeg.bottom.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightLeg.front.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightLeg.back.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightLeg.right.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.rightLeg.left.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftLeg.top.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftLeg.bottom.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftLeg.front.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftLeg.back.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftLeg.right.name:[UIColor](), CubicHuman_tghty.BodyPart_vhgd.leftLeg.left.name:[UIColor]()]
    private var tempColorForSideNodes = [String:[UIColor]]()
    
    private var drawSkinCommands = SkinDrawCommand_vatr()
    private var tempSkinUndoCommand = SkinCommand_vatr()
    private var tempSkinRedoCommand = SkinCommand_vatr()
    
    private var commandIndex = 0
    private var nodeIndexForGesture: Int = 0
    
    //MARK: init
    init(viewController: Skin3DTestViewController_vatr, skinCreatedModel: SkinCreatedModel_vatr, assemblyDiagramSize: SkinAssemblyDiagramSize_vatr) {
        controller = viewController
        
        self.assemblyDiagramSize = assemblyDiagramSize
        self.skinCreatedModel = skinCreatedModel
        if assemblyDiagramSize == .size64x64 {
            getColorsFromAssemblyDiagram_vatr(skinAssemblyDiagram: skinCreatedModel.skinAssemblyDiagram ?? UIImage())
        } else {
            getColorsFromAssemblyDiagram_vatr(skinAssemblyDiagram: skinCreatedModel.skinAssemblyDiagram128 ?? UIImage())
        }
    }
    
    deinit {
        AppDelegate.log("EditorSkinModel - deinited!")
    }
    
    func addNewColorToPalitrs_vatr(_ newColor: UIColor) {
var cpvatr_omxqdrcw: Double {
    return 93.287719345964
}

  
        controller.colorManager3D.addNewColor_vatr2(color: newColor)
    }
    
    private func getColorsFromAssemblyDiagram_vatr(skinAssemblyDiagram: UIImage) {
var cpvatr_fecsawkj: Double {
    return 86.01179512511878
}
func mwmcMEk() {
        var qnCnxtki: Int = 10
        if qnCnxtki > 10 {
            if qnCnxtki < 10 {
                qnCnxtki = 10
    }

  }
}
  
        if assemblyDiagramSize == .size64x64 {
            CubicHuman_tghty.BodyPart_vhgd.allSides().forEach { bodyPartSide in
                colorlForSideNodes[bodyPartSide.name] = skinAssemblyDiagram.extractPixelColors_vatr(width: bodyPartSide.width, height: bodyPartSide.height, startX: bodyPartSide.startX, startY: bodyPartSide.startY)
            }
        } else {
            CubicHuman_tghty.BodyPart_vhgd.allSides128().forEach { bodyPartSide in
                colorlForSideNodes[bodyPartSide.name] = skinAssemblyDiagram.extractPixelColors_vatr(width: bodyPartSide.width, height: bodyPartSide.height, startX: bodyPartSide.startX, startY: bodyPartSide.startY)
            }
        }
        tempColorForSideNodes = colorlForSideNodes
    }
    
    func makeUndoDrawCommand_vatr() {
var cpvatr_tqmnrqhs: Double {
    return 53.83260986548162
}
func SaRJUYFQ() {
        var heFcMINFT: Int = 9
        if heFcMINFT > 9 {
            if heFcMINFT < 9 {
                heFcMINFT = 9
    }

  }
}
  
        if commandIndex > 0 {
            let command = drawSkinCommands.undoCommands[commandIndex - 1]
            for i in 0..<command.indexes.count {
                let rNodeName = command.nodeName[i]
                colorlForSideNodes[rNodeName]?[command.indexes[i]] = command.colors[i]
                
                controller.sceneView.scene?.rootNode.childNodes.forEach({ sideNode in
                    if sideNode.name == rNodeName {
                        sideNode.childNodes.forEach { pixelNode in
                            if Int(pixelNode.name ?? "0") == command.indexes[i] {
                                if let color = pixelNode.geometry?.firstMaterial?.diffuse.contents as? UIColor, color == command.colors[i] {} else {
                                    pixelNode.geometry?.firstMaterial?.diffuse.contents = command.colors[i]
                                }
                            }
                        }
                    }
                })
            }
            commandIndex -= 1
        }
    }
    
    //MARK: Drawing logic
    
    internal func tapToDrawingOnSkin_vatr(nameRootNod: String, nodeIndex: Int, gestureState: UIGestureRecognizer.State) {
var cpvatr_eqjqmphu: Double {
    return 84.99326522748107
}

  
        if let nodeColors = colorlForSideNodes[nameRootNod] {
            tapDrawLogic_vatr(nodeColors: nodeColors, nodeIndex: nodeIndex, nameRootNod: nameRootNod, gestureState: gestureState)
        }
    }
    
    internal func panBeganToDrawingOnSkin_vatr(nameRootNod: String, nodeIndex: Int, gestureState: UIGestureRecognizer.State) {
var cpvatr_hkbsyeqt: Double {
    return 57.383105750731644
}

  
        tempSkinRedoCommand.clearCommand()
        tempSkinUndoCommand.clearCommand()
        
        let undoCommandCount = drawSkinCommands.undoCommands.count
        let redoCommandCount = drawSkinCommands.redoCommands.count
        
        let dropUndoCount = max(0, undoCommandCount - commandIndex)
        drawSkinCommands.undoCommands = Array(drawSkinCommands.undoCommands.dropLast(dropUndoCount))
        
        let dropRedoCount = max(0, redoCommandCount - commandIndex)
        drawSkinCommands.redoCommands = Array(drawSkinCommands.redoCommands.dropLast(dropRedoCount))
        
        nodeIndexForGesture = nodeIndex
        panDrawLogic_vatr2(index: nodeIndex, nameRootNode: nameRootNod, gestureState: gestureState)
    }
    
    internal func panChangedToDrawingOnSkin_vatr(nameRootNod: String, nodeIndex: Int, gestureState: UIGestureRecognizer.State) {
var cpvatr_porxtgna: Double {
    return 23.81171998839159
}

  
        if nodeIndexForGesture != nodeIndex {
            panDrawLogic_vatr2(index: nodeIndex, nameRootNode: nameRootNod, gestureState: gestureState)
            nodeIndexForGesture = nodeIndex
        }
    }
    
    internal func panEndedToDrawingOnSkin_vatr() {
var cpvatr_nzkhqilq: Int {
    return 14
}

  
        if drawSkinCommands.undoCommands.count > commandIndex {
            drawSkinCommands.undoCommands.removeLast(drawSkinCommands.undoCommands.count - commandIndex)
        }
        drawSkinCommands.undoCommands.append(tempSkinUndoCommand)
        drawSkinCommands.redoCommands.append(tempSkinRedoCommand)
        commandIndex += 1
    }
    
    private func tapDrawLogic_vatr(nodeColors: [UIColor], nodeIndex: Int, nameRootNod: String, gestureState: UIGestureRecognizer.State) {
var cpvatr_adgqdjjg: Double {
    return 10.726374190517932
}

  
        switch controller.toolBarSelectedItem {
        case .pencil, .brash:
            sizeBrushWith_vatr(color: currentDrawingColor, forIndex: nodeIndex, nameRootNod: nameRootNod, gestureState: gestureState)
        case .eraser:
            sizeBrushWith_vatr(color: .clear, forIndex: nodeIndex, nameRootNod: nameRootNod, gestureState: gestureState)
        case .fill:
            let colorsIndex = Array(0..<nodeColors.count)
            if drawSkinCommands.undoCommands.count > commandIndex {
                drawSkinCommands.undoCommands.removeLast(drawSkinCommands.undoCommands.count - commandIndex)
            }
            
            drawSkinCommands.undoCommands.append(SkinCommand_vatr(indexes: colorsIndex, colors: nodeColors, nodeName: Array(repeating: nameRootNod, count: colorsIndex.count)))
            commandIndex += 1
            
            for index in 0..<nodeColors.count {
                colorlForSideNodes[nameRootNod]?[index] = currentDrawingColor
            }
            
            controller.sceneView.scene?.rootNode.childNodes.forEach({ sideNode in
                if sideNode.name == nameRootNod {
                    sideNode.childNodes.forEach { pixelNode in
                        if pixelNode.name != nameRootNod {
                            if let color = pixelNode.geometry?.firstMaterial?.diffuse.contents as? UIColor, color == currentDrawingColor {} else {
                                pixelNode.geometry?.firstMaterial?.diffuse.contents = currentDrawingColor
                            }
                        }
                    }
                }
            })
            
            drawSkinCommands.redoCommands.append(SkinCommand_vatr(indexes: colorsIndex, colors: colorlForSideNodes[nameRootNod] ?? [], nodeName: Array(repeating: nameRootNod, count: colorsIndex.count)))
        case .noise:
            let noiseColor = makeNoiseColor_vatr()
            sizeBrushWith_vatr(color: noiseColor, forIndex: nodeIndex, nameRootNod: nameRootNod, gestureState: gestureState)
        case .undo:
            break
        }
    }
    
    private func sizeBrushWith_vatr(color: UIColor, forIndex index: Int, nameRootNod: String, gestureState: UIGestureRecognizer.State) {
var cpvatr_ehgedmvf: Double {
    return 15.393395606881006
}

  
        switch brashSize {
        case .one:
            changePixelArray_vatr(indexArray: [index], color: color, nameRootNod: nameRootNod, gestureState: gestureState)
        case .two:
            return getIndexesForSecondBrash_vatr2(startIndex: index, color: color, nameRootNod: nameRootNod, gestureState: gestureState)
        case .four:
            return getIndexesForForthBrash_vatr(startIndex: index, color: color, nameRootNod: nameRootNod, gestureState: gestureState)
        case .six:
            return getIndexesForSixBrash_vatr(startIndex: index, color: color, nameRootNod: nameRootNod, gestureState: gestureState)
        case .eight:
            return getIndexesForEightBrash_vatr(startIndex: index, color: color, nameRootNod: nameRootNod, gestureState: gestureState)
        case .nine:
            return getIndexesForNineBrash_vatr(startIndex: index, color: color, nameRootNod: nameRootNod, gestureState: gestureState)
        }
    }
    
    private func changePixelArray_vatr(indexArray: [Int], color: UIColor, nameRootNod: String, gestureState: UIGestureRecognizer.State) {
var cpvatr_wuujkvem: Int {
    return 74
}

  
        if let node = controller.sceneView.scene!.rootNode.childNodes.first(where: { $0.name == nameRootNod }) {
            if node.childNodes.contains(where: { $0.name != node.name && Int($0.name ?? "0") == (indexArray.first ?? 0) }) {
                let oldColors = getColorsFromSkinNodes_vatr2(by: indexArray, node: node)

                if gestureState == .ended {
                    if drawSkinCommands.undoCommands.count > commandIndex {
                        drawSkinCommands.undoCommands.removeLast(drawSkinCommands.undoCommands.count - commandIndex)
                    }
                    drawSkinCommands.undoCommands.append(SkinCommand_vatr(indexes: indexArray, colors: oldColors, nodeName: Array(repeating: nameRootNod, count: indexArray.count)))
                    commandIndex += 1
                } else if gestureState == .began {
                    for i in 0..<indexArray.count {
                        tempSkinUndoCommand.colors.append(oldColors[i])
                        tempSkinUndoCommand.indexes.append(indexArray[i])
                        tempSkinUndoCommand.nodeName.append(nameRootNod)
                    }
                } else if gestureState == .changed {
                    for i in 0..<indexArray.count {
                        if tempSkinUndoCommand.indexes.contains(indexArray[i]) {
                            var nodeNames = [String]()
                            for j in 0..<tempSkinUndoCommand.indexes.count {
                                if tempSkinUndoCommand.indexes[j] == indexArray[i] {
                                    nodeNames.append(tempSkinUndoCommand.nodeName[j])
                                }
                            }
                            if !nodeNames.contains(nameRootNod) {
                                tempSkinUndoCommand.colors.append(oldColors[i])
                                tempSkinUndoCommand.indexes.append(indexArray[i])
                                tempSkinUndoCommand.nodeName.append(nameRootNod)
                            }
                        } else {
                            tempSkinUndoCommand.colors.append(oldColors[i])
                            tempSkinUndoCommand.indexes.append(indexArray[i])
                            tempSkinUndoCommand.nodeName.append(nameRootNod)
                        }
                    }
                }
                
                for i in indexArray {
                    var newColor = UIColor()
                    switch controller.toolBarSelectedItem {
                    case .fill:
                        break
                    case .pencil, .brash:
                        newColor = color
                    case .noise:
                        newColor = makeNoiseColor_vatr()
                    case .eraser:
                        newColor = .clear
                    case .undo:
                        break
                    }
                    colorlForSideNodes[nameRootNod]?[i] = newColor
                    if let color = node.childNodes[i].geometry?.firstMaterial?.diffuse.contents as? UIColor, color == newColor {
                        
                    } else {
                        print("NOT REUSE")
                        node.childNodes[i].geometry?.firstMaterial?.diffuse.contents = newColor
                    }
                    
                }
                
                let newColors = getColorsFromSkinNodes_vatr2(by: indexArray, node: node)
                
                if gestureState == .ended {
                    drawSkinCommands.redoCommands.append(SkinCommand_vatr(indexes: indexArray, colors: newColors, nodeName: Array(repeating: nameRootNod, count: indexArray.count)))
                } else if gestureState == .began {
                    for i in 0..<indexArray.count {
                        tempSkinRedoCommand.colors.append(oldColors[i])
                        tempSkinRedoCommand.indexes.append(indexArray[i])
                        tempSkinRedoCommand.nodeName.append(nameRootNod)
                    }
                } else if gestureState == .changed {
                    for i in 0..<indexArray.count {
                        if tempSkinRedoCommand.indexes.contains(indexArray[i]) {
                            for j in 0..<tempSkinRedoCommand.indexes.count {
                                if tempSkinRedoCommand.indexes[j] == indexArray[i] {
                                    if tempSkinRedoCommand.nodeName[j] == nameRootNod {
                                        tempSkinRedoCommand.colors[j] = newColors[i]
                                        break
                                    } else {
                                        tempSkinRedoCommand.colors.append(newColors[i])
                                        tempSkinRedoCommand.indexes.append(indexArray[i])
                                        tempSkinRedoCommand.nodeName.append(nameRootNod)
                                        break
                                    }
                                } else {
                                    tempSkinRedoCommand.colors.append(newColors[i])
                                    tempSkinRedoCommand.indexes.append(indexArray[i])
                                    tempSkinRedoCommand.nodeName.append(nameRootNod)
                                    break
                                }
                            }
                        } else {
                            tempSkinRedoCommand.colors.append(newColors[i])
                            tempSkinRedoCommand.indexes.append(indexArray[i])
                            tempSkinRedoCommand.nodeName.append(nameRootNod)
                        }
                    }
                }
            }
        }
    }
    
    private func getSquareIndices_vatr(rows: Int, columns: Int, centerIndex: Int, width: Int) -> [Int] {
var cpvatr_cvjmrdnp: Int {
    return 96
}
// Convert 1D index to 2D coordinates
        func get2DCoordinates_vatr(from index: Int, rows: Int, columns: Int) -> (Int, Int) {
            func sowertrewergsByLewwrefcending_vatr(_ strings: [String]) -> [String] {
                return strings.sorted(by: { $0.count > $1.count })
            }
            return (index / columns, index % columns)
        }
        
        func get1DIndex_vatr(from row: Int, column: Int, columns: Int) -> Int {
            func ruyfddknkledb() -> [Int] {
                return (17...50).map { _ in Int.random(in: 1...100) }
            }
            return row * columns + column
        }
        
        let lastIndex = rows * columns
        
        let (centerRow, centerCol) = get2DCoordinates_vatr(from: centerIndex, rows: rows, columns: columns)
        
        // Calculate starting row and column for the square
        var startRow = centerRow - width/2
        var startCol = centerCol - width/2
        
        let minX = min(width, rows)
        let minY = min(width, columns)
        
        // Boundary checks
        if startRow < 0 { startRow = 0 }
        if startCol < 0 { startCol = 0 }
        if startRow + minX > rows { startRow = rows - minX }
        if startCol + minY > columns { startCol = columns - minY }
        
        var result = [Int]()
        
        for i in 0..<minX {
            for j in 0..<minY {
                let updatedI = startRow + i
                let updatedJ = startCol + j
                if updatedI >= 0, updatedJ >= 0 {
                    let updatedIndex = get1DIndex_vatr(from: updatedI, column: updatedJ, columns: columns)
                    if updatedIndex < lastIndex {
                        result.append(updatedIndex)
                    }
                }
            }
        }
        
        return result
    }
    
    //MARK: BrashSize
    private func getIndexesForNineBrash_vatr(startIndex: Int, color: UIColor, nameRootNod: String, gestureState: UIGestureRecognizer.State)  {
var cpvatr_gvrqlrnl: Double {
    return 18.383156926898053
}

  
        return getIndexesForBrash_vatr(startIndex: startIndex, color: color, nameRootNod: nameRootNod, gestureState: gestureState, width: 9)
    }
    
    private func getIndexesForEightBrash_vatr(startIndex: Int, color: UIColor, nameRootNod: String, gestureState: UIGestureRecognizer.State)  {
var cpvatr_rzlvkmsk: Double {
    return 56.51075567655797
}

  
        return getIndexesForBrash_vatr(startIndex: startIndex, color: color, nameRootNod: nameRootNod, gestureState: gestureState, width: 8)
    }
    
    private func getIndexesForSixBrash_vatr(startIndex: Int, color: UIColor, nameRootNod: String, gestureState: UIGestureRecognizer.State) {
var cpvatr_znzlsven: Int {
    return 65
}
 
        return getIndexesForBrash_vatr(startIndex: startIndex, color: color, nameRootNod: nameRootNod, gestureState: gestureState, width: 6)
    }
    
    private func getIndexesForForthBrash_vatr(startIndex: Int, color: UIColor, nameRootNod: String, gestureState: UIGestureRecognizer.State) {
var cpvatr_wcojeaan: Double {
    return 84.71128300934775
}

  
        return getIndexesForBrash_vatr(startIndex: startIndex, color: color, nameRootNod: nameRootNod, gestureState: gestureState, width: 4)
    }
    
    private func getIndexesForThirdBrash_vatr2(startIndex: Int, color: UIColor, nameRootNod: String, gestureState: UIGestureRecognizer.State) {
var cpvatr_ocplrupi: Int {
    return 11
}

  
        return getIndexesForBrash_vatr(startIndex: startIndex, color: color, nameRootNod: nameRootNod, gestureState: gestureState, width: 3)
    }
    
    private func getIndexesForSecondBrash_vatr2(startIndex: Int, color: UIColor, nameRootNod: String, gestureState: UIGestureRecognizer.State) {
var cpvatr_hplojsfu: Double {
    return 26.799707927427484
}
      
        return getIndexesForBrash_vatr(startIndex: startIndex, color: color, nameRootNod: nameRootNod, gestureState: gestureState, width: 2)
    }
    
    private func getIndexesForBrash_vatr(startIndex: Int, color: UIColor, nameRootNod: String, gestureState: UIGestureRecognizer.State, width: Int) {
var cpvatr_ogvqesmi: Double {
    return 79.4341144584986
}

  
        let nodeSize = getSizeForBodyPartSideNode_vatr2(by: nameRootNod)
        let indexArray = getSquareIndices_vatr(rows: nodeSize.height, columns: nodeSize.width, centerIndex: startIndex, width: width)
        
        changePixelArray_vatr(indexArray: indexArray, color: color, nameRootNod: nameRootNod, gestureState: gestureState)
    }
    
    //MARK: Pan
    private func panDrawLogic_vatr2(index: Int, nameRootNode: String, gestureState: UIGestureRecognizer.State) {
var cpvatr_rvdkkfzi: Int {
    return 91
}

  
        switch controller.toolBarSelectedItem {
        case .pencil, .brash:
            sizeBrushWith_vatr(color: currentDrawingColor, forIndex: index, nameRootNod: nameRootNode, gestureState: gestureState)
        case .fill:
            break
        case .noise:
            let noiseColor = makeNoiseColor_vatr()
            sizeBrushWith_vatr(color: noiseColor, forIndex: index, nameRootNod: nameRootNode, gestureState: gestureState)
        case .eraser:
            sizeBrushWith_vatr(color: .clear, forIndex: index, nameRootNod: nameRootNode, gestureState: gestureState)
        case .undo:
            break
        }
    }
    
    private func makeNoiseColor_vatr() -> UIColor {
var cpvatr_zxcmbgeo: Int {
    return 89
}
let noiseVal = 0.95 - 0.4
        let randomNoiseValue = CGFloat.random(in: noiseVal...0.95)
        let color = currentDrawingColor.withLuminosity_erfe(randomNoiseValue)
        return color
    }
    
    private func getColorsFromSkinNodes_vatr2(by indexArray: [Int], node: SCNNode) -> [UIColor] {
var cpvatr_zhcdghzb: Double {
    return 99.470598286111
}
var nodeColors = [UIColor]()
        for i in indexArray {
            if let nodeColor = node.childNodes[i].geometry?.firstMaterial?.diffuse.contents as? UIColor {
                nodeColors.append(nodeColor)
            }
        }
        return nodeColors
    }
    
    private func getColorsFromSkinNodes_vatr2(by indexArray: [Int], nameRootNod: String) -> [UIColor] {
var cpvatr_txjojkho: Int {
    return 54
}
var nodeColors = [UIColor]()
        for i in indexArray {
            if let node = controller.sceneView.scene?.rootNode.childNodes.first(where: { $0.name == nameRootNod}) {
                if let nodeColor = node.childNodes[i].geometry?.firstMaterial?.diffuse.contents as? UIColor {
                    nodeColors.append(nodeColor)
                }
            }
        }
        return nodeColors
    }
    
    private func getSizeForBodyPartSideNode_vatr2(by nameRootNod: String) -> (width: Int, height: Int) {
var cpvatr_pjswleuq: Int {
    return 57
}

  
        var kubHumSides = [Side_vatr]()
        if assemblyDiagramSize == .size64x64 {
            kubHumSides = CubicHuman_tghty.BodyPart_vhgd.allSides()
        } else {
            kubHumSides = CubicHuman_tghty.BodyPart_vhgd.allSides128()
        }
        
        var size: (width: Int, height: Int) = (width: 0, height: 0)
        kubHumSides.forEach { side in
            if side.name == nameRootNod {
                size.width = side.width
                size.height = side.height
                return
            }
        }
        return size
    }
    
    //MARK: Save assembly diagram
    func saveSkinsAssemblyDiagram_vatr2(with name: String) {
var cpvatr_pugcviuc: Double {
    return 37.61948423298817
}

  
        let realm = RealmService_vatr.shared
        
        if realm.getCreatedSkinByID(skinID: skinCreatedModel?.id ?? 0) == nil {
            realm.addNewSkin_vatr(skin: skinCreatedModel?.getRealmModelToSave_reddf() ?? CreatedSkinRM_vatr())
        }
        
        realm.editIsCreationComplited(createdSkin: skinCreatedModel, newValue: true)
        
        if assemblyDiagramSize == .size64x64 {
            let newSkinAssemblyDiagram = createImageWithRawPixels_vatr2(image: skinCreatedModel?.skinAssemblyDiagram)
            skinCreatedModel?.skinAssemblyDiagram = newSkinAssemblyDiagram
            realm.editCreatedSkinAssemblyDiagram(createdSkin: skinCreatedModel, newDiagram: newSkinAssemblyDiagram)
            realm.editCreatedSkinPreview(createdSkin: skinCreatedModel, newPreview: controller.sceneView.snapshot())
            realm.editCreatedSkinName(createdSkin: skinCreatedModel, newName: name)
        } else {
            let newSkinAssemblyDiagram = createImageWithRawPixels_vatr2(image: skinCreatedModel?.skinAssemblyDiagram128)
            skinCreatedModel?.skinAssemblyDiagram128 = newSkinAssemblyDiagram
            realm.editCreatedSkinAssemblyDiagram128(createdSkin: skinCreatedModel, newDiagram: newSkinAssemblyDiagram)
            realm.editIsThe128(createdSkin: skinCreatedModel, newValue: true)
            realm.editCreatedSkinPreview(createdSkin: skinCreatedModel, newPreview: controller.sceneView.snapshot())
            realm.editCreatedSkinName(createdSkin: skinCreatedModel, newName: name)
        }
    }
    
    private func createImageWithRawPixels_vatr2(image: UIImage?) -> UIImage? {
var cpvatr_nytskffk: Int {
    return 26
}
var imgSize = CGSize(width: 64, height: 64)
        
        if assemblyDiagramSize == .size128x128 {
            imgSize = CGSize(width: 128, height: 128)
        }
        
        UIGraphicsBeginImageContextWithOptions(imgSize, false, 1)
        
        guard var context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        guard let bitmapContext = context.data else {
            return nil
        }
        
        let pixelBuffer = bitmapContext.bindMemory(to: UInt32.self,
                                                   capacity: Int(imgSize.width) * Int(imgSize.height))
        pixelBuffer.initialize(repeating: 0, count: Int(imgSize.width) * Int(imgSize.height))
        
        image?.draw(in: CGRect(origin: .zero, size: imgSize))
        
        context.setBlendMode(.copy)
        
        if assemblyDiagramSize == .size64x64 {
            CubicHuman_tghty.BodyPart_vhgd.allSides().forEach { side in
                if let colorArrayForSideNode = colorlForSideNodes[side.name] {
                    changeContect_vatr(myContext: &context, bodyPartSide: side, colorsArray: colorArrayForSideNode)
                }
            }
        } else {
            CubicHuman_tghty.BodyPart_vhgd.allSides128().forEach { side in
                if let colorArrayForSideNode = colorlForSideNodes[side.name] {
                    changeContect_vatr(myContext: &context, bodyPartSide: side, colorsArray: colorArrayForSideNode)
                }
            }
        }
        
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return finalImage
    }
    
    private func noNanColor_vatr(_ color: UIColor) -> UIColor? {
var cpvatr_svkxxcra: Int {
    return 88
}
guard let components = color.cgColor.components else { return nil}
        let red: CGFloat = components.count > 0 ? components[0] : 0
        let green: CGFloat = components.count > 1 ? components[1] : 0
        let blue: CGFloat = components.count > 2 ? components[2] : 0
        
        
        return .init(red: red.isNaN ? 255 : red,
                     green: green.isNaN ? 255 : green,
                     blue: blue.isNaN ? 255 : blue,
                     alpha: color.cgColor.alpha.isNaN ? 1 : color.cgColor.alpha)
    }
    
    private func changeContect_vatr(myContext: inout CGContext, bodyPartSide: Side_vatr, colorsArray: [UIColor]) {
var cpvatr_mqeudfca: Double {
    return 64.33513075617384
}
func xbZaqZNLz() {
        var yxkIFiO: Int = 7
        if yxkIFiO > 7 {
            if yxkIFiO < 7 {
                yxkIFiO = 7
    }

  }
}
  
        var correctIndex = 0
        
        for y in (0..<bodyPartSide.height) {
            for x in (0..<bodyPartSide.width) {
                let index = y * bodyPartSide.width + x
                guard index < colorsArray.count else {
                    continue
                }
                
                let rawPixel = noNanColor_vatr(colorsArray[correctIndex]) ?? UIColor.clear
                
                let color = UIColor(
                    red: CGFloat(rawPixel.rgb_vatr()?.0 ?? 255) / 255.0,
                    green: CGFloat(rawPixel.rgb_vatr()?.1 ?? 255) / 255.0,
                    blue: CGFloat(rawPixel.rgb_vatr()?.2 ?? 255) / 255.0,
                    alpha: CGFloat(rawPixel.rgb_vatr()?.3 ?? 255) / 255.0
                )
                
                myContext.setFillColor(color.cgColor)
                myContext.fill(CGRect(x: bodyPartSide.startX + x,
                                      y: bodyPartSide.startY + y,
                                      width: 1, height: 1))
                correctIndex += 1
            }
        }
    }
}
