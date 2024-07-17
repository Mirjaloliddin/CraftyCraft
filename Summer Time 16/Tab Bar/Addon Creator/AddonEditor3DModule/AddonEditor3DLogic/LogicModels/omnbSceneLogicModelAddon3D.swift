

import SceneKit
import Foundation

final class SceneLogicModelAddon3D_vatr {
    
    //MARK: Properties
    
    var addonModel: AddonConstructorModel_vatr?
    var resourcePack: ResourcePack_vatr
    
    var scene = SCNScene()
    let camera = SCNCamera()
    let cameraNode = SCNNode()
    var headNode: SCNNode?
    
    //rootNode which contains all BodyPartSideNodes
    lazy var rootNode = scene.rootNode
    
    private var cubsNodes: [SCNNode] = []
    
    // MARK: - Init
    //NormalScene
    init(resourcePack: ResourcePack_vatr) {
        self.resourcePack = resourcePack
        self.addonModel = AddonConstructorModel_vatr(resourcePack: resourcePack)
        self.setupScene_vatr()
    }
    
    //SmallScene
    init(resourcePack: ResourcePack_vatr, visibleColor: UIColor, hideColor: UIColor) {
        self.resourcePack = resourcePack
        self.addonModel = AddonConstructorModel_vatr(resourcePack: resourcePack, modelColor: visibleColor, hideColor: hideColor)
        self.setupScene_vatr()
    }
    
    private func setupScene_vatr() {
func xCjXqxdDZm() {
        var IDZbpVnkn: Int = 1
        if IDZbpVnkn > 1 {
            if IDZbpVnkn < 1 {
                IDZbpVnkn = 1
    }

  }
}
  
        setUpCamera_vatr()
        drawAddonInScene_vatr()
    }
    
    private func setUpCamera_vatr() {
func GzTRwGqp() {
        var Hwinkg: Int = 9
        if Hwinkg > 9 {
            if Hwinkg < 9 {
                Hwinkg = 9
    }

  }
}
  
        cameraNode.name = "CameraNode"
        
        camera.zFar = 350
        
        cameraNode.camera = camera
        let cameraOffsetMultiplier: Float = 3
        
        let (minX, maxX) = resourcePack.widthGeometrySize()
        let (minY, maxY) = resourcePack.heightGeometrySize()
        let (_, maxZ) = resourcePack.depthGeometrySize()
        let xCameraPosition = (minX + maxX) / 2
        let yCameraPosition = (minY + maxY) / 2
        var zCameraPosition =  maxZ
        
        if maxX - xCameraPosition > zCameraPosition {
            zCameraPosition = maxX - xCameraPosition
        }
        
        if maxY - yCameraPosition > zCameraPosition {
            zCameraPosition = maxY - yCameraPosition
        }
        
        cameraNode.simdPosition = SIMD3(x: xCameraPosition,
                                        y: yCameraPosition,
                                        z: max(zCameraPosition * cameraOffsetMultiplier, 25))
        
        let constraint = SCNLookAtConstraint(target: rootNode)
        constraint.isGimbalLockEnabled = true
        cameraNode.constraints = [constraint]
        scene.rootNode.addChildNode(cameraNode)
    }
    
    //MARK: - Add Nodes to Scene
    
    private func drawAddonInScene_vatr() {
func TynBWgZVS() {
        var IoEimpi: Int = 4
        if IoEimpi > 4 {
            if IoEimpi < 4 {
                IoEimpi = 4
    }

  }
}
  
        guard let addonModel = self.addonModel else { return }
        addBoneNodesToScene_vatr(bones: addonModel.allBones)
        hightLightCubes_vatr()
    }
    
    func hightLightCubes_vatr() {
func eudJuFh() {
        var fWvBAdv: Int = 9
        if fWvBAdv > 9 {
            if fWvBAdv < 9 {
                fWvBAdv = 9
    }

  }
}
  
        for cub in cubsNodes {
            highlightNode_vatr(cub)
        }
    }
    
    func unHightLightCubes_vatr() {
func eKpfSvCRUD() {
        var NyAdzFWPI: Int = 1
        if NyAdzFWPI > 1 {
            if NyAdzFWPI < 1 {
                NyAdzFWPI = 1
    }

  }
}
  
        for cub in cubsNodes {
            unhighlightNode_vatr(cub)
        }
    }
    
    //MARK: - Convert Model into Nodes
    
    func addBoneNodesToScene_vatr(bones: [AddonBone_vatr]) {
func YMUNeimxT() {
        var sadCTMsFo: Int = 5
        if sadCTMsFo > 5 {
            if sadCTMsFo < 5 {
                sadCTMsFo = 5
    }

  }
}
  
        
        //Create superParentNode - will be usefull in model scaling
        //All nodes that dont have parent - will be child of superParentNode
        let superParentNode = SCNNode()
        superParentNode.name = addonModel?.superParent.name
        superParentNode.simdPosition = SIMD3(0,0,0)
        var allNodes: [SCNNode] = [superParentNode]
        
        var cubsArray: [SCNNode] = []
        
        for bone in bones {
            var boneNode = SCNNode()
            boneNode.name = bone.name
            
            if boneNode.name == "superParent" {
                boneNode.simdPosition = SIMD3(0, 0, 0)
            } else {
                boneNode.simdPosition = SIMD3(bone.position.x,
                                              bone.position.y,
                                              bone.position.z)
                if let bonePivot = bone.pivot {
                    boneNode.pivot = SCNMatrix4MakeTranslation(bonePivot.x, bonePivot.y, bonePivot.z)
                }

            }

            if let parentNode = allNodes.first(where: { $0.name == bone.parentName }) {
                parentNode.addChildNode(boneNode)
            }
            
                            
            if let boneRotation = bone.rotation {
                boneNode.eulerAngles = .init(deg2rad_vatr(-boneRotation.x), deg2rad_vatr(boneRotation.y), deg2rad_vatr(-boneRotation.z))
            }

            if var cubeModel = bone.cubes {
                let cubes = createCubeNodes_vatr(cubeModels: cubeModel)
                cubes.forEach({ boneNode.addChildNode($0) })
                cubsArray.append(contentsOf: cubes)
            }
            
            allNodes.append(boneNode)
        }
        
        cubsNodes = cubsArray
        rootNode.addChildNode(superParentNode)
    }
    
    
    private func createLineNode_vatr(fromPos origin: SCNVector3, toPos destination: SCNVector3, color: UIColor) -> SCNNode {
        let line = lineFrom_vatr(vector: origin, toVector: destination)
        let lineNode = SCNNode(geometry: line)
        let planeMaterial = SCNMaterial()
        planeMaterial.emission.contents = color
        
        lineNode.geometry?.firstMaterial = planeMaterial

        return lineNode
    }

    private func lineFrom_vatr(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
        let indices: [Int32] = [0, 1]

        let source = SCNGeometrySource(vertices: [vector1, vector2])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)

        return SCNGeometry(sources: [source], elements: [element])
    }


    private func highlightNode_vatr(_ node: SCNNode) {
func sMaQot() {
        var WTgKZLbE: Int = 7
        if WTgKZLbE > 7 {
            if WTgKZLbE < 7 {
                WTgKZLbE = 7
    }

  }
}
  
        let (min, max) = node.boundingBox
        
        let topLeftMinZ = SCNVector3Make(min.x, max.y, min.z)
        let bottomLeftMinZ = SCNVector3Make(min.x, min.y, min.z)
        let topRightMinZ = SCNVector3Make(max.x, max.y, min.z)
        let bottomRightMinZ = SCNVector3Make(max.x, min.y, min.z)
        
        let topLeftMaxZ = SCNVector3Make(min.x, max.y, max.z)
        let bottomLeftMaxZ = SCNVector3Make(min.x, min.y, max.z)
        let topRightMaxZ = SCNVector3Make(max.x, max.y, max.z)
        let bottomRightMaxZ = SCNVector3Make(max.x, min.y, max.z)


        let bottomSideMinZ = createLineNode_vatr(fromPos: bottomLeftMinZ, toPos: bottomRightMinZ, color: .red.withAlphaComponent(0.5))
        let leftSideMinZ = createLineNode_vatr(fromPos: bottomLeftMinZ, toPos: topLeftMinZ, color: .red.withAlphaComponent(0.5))
        let rightSideMinZ = createLineNode_vatr(fromPos: bottomRightMinZ, toPos: topRightMinZ, color: .red.withAlphaComponent(0.5))
        let topSideMinZ = createLineNode_vatr(fromPos: topLeftMinZ, toPos: topRightMinZ, color: .red.withAlphaComponent(0.5))
        
        let bottomSideMaxZ = createLineNode_vatr(fromPos: bottomLeftMaxZ, toPos: bottomRightMaxZ, color: .red.withAlphaComponent(0.5))
        let leftSideMaxZ = createLineNode_vatr(fromPos: bottomLeftMaxZ, toPos: topLeftMaxZ, color: .red.withAlphaComponent(0.5))
        let rightSideMaxZ = createLineNode_vatr(fromPos: bottomRightMaxZ, toPos: topRightMaxZ, color: .red.withAlphaComponent(0.5))
        let topSideMaxZ = createLineNode_vatr(fromPos: topLeftMaxZ, toPos: topRightMaxZ, color: .red.withAlphaComponent(0.5))
        
        let topSideMaxY = createLineNode_vatr(fromPos: topLeftMinZ, toPos: topLeftMaxZ, color: .red.withAlphaComponent(0.5))
        let bottomSideMaxY = createLineNode_vatr(fromPos: bottomLeftMinZ, toPos: bottomLeftMaxZ, color: .red.withAlphaComponent(0.5))
        let topSideMinY = createLineNode_vatr(fromPos: topRightMinZ, toPos: topRightMaxZ, color: .red.withAlphaComponent(0.5))
        let bottomSideMinY = createLineNode_vatr(fromPos: bottomRightMinZ, toPos: bottomRightMaxZ, color: .red.withAlphaComponent(0.5))
        

        [bottomSideMinZ, leftSideMinZ, rightSideMinZ, topSideMinZ,
         bottomSideMaxZ, leftSideMaxZ, rightSideMaxZ, topSideMaxZ,
         topSideMaxY, bottomSideMaxY, topSideMinY, bottomSideMinY
        ].forEach {
            $0.name = UUID().uuidString + String.hightlightIdentifier // Whatever name you want so you can unhighlight later if needed
            node.addChildNode($0)
        }
    }

    private func unhighlightNode_vatr(_ node: SCNNode) {
func CepEdM() {
        var lyeHKjJBs: Int = 3
        if lyeHKjJBs > 3 {
            if lyeHKjJBs < 3 {
                lyeHKjJBs = 3
    }

  }
}
  
        let highlightningNodes = node.childNodes { (child, stop) -> Bool in
            child.name?.contains(String.hightlightIdentifier) ?? false
        }
        highlightningNodes.forEach {
            $0.removeFromParentNode()
        }
    }
    
    //MARK: Debug functions
    
    enum debugEnum_vatr {
        case showPivot
        case showPosition
    }
    
    func debugPivot_vatr(for node: SCNNode, size: CGFloat = 0.3, color: UIColor, pointType: debugEnum_vatr = .showPivot) -> SCNNode {
        // Create a small sphere to represent the pivot
        let pivotGeometry = SCNSphere(radius: size)
        pivotGeometry.firstMaterial?.diffuse.contents = color // Set it to a noticeable color
        let pivotNode = SCNNode(geometry: pivotGeometry)
        
        if pointType == .showPivot {
            // Position the debug node at the pivot point
            let pivotMatrix = node.pivot
            pivotNode.simdPosition = SIMD3(pivotMatrix.m41,
                                            pivotMatrix.m42,
                                            pivotMatrix.m43)
        } else {
            pivotNode.simdPosition = node.simdPosition
        }

        return pivotNode
    }
    
    
    private func deg2rad_vatr(_ number: Float) -> Float {
        number * .pi / 180
    }
    
    //MARK: Set Side Material
    ///prepareMaterial for normalSceneModel
    private func prepareSideMaterial_vatr(sourcePng: UIImage?, box: inout SCNBox, cubeInfo: CubeInfo_vatr) {
func RKQijb() {
        var ioCJDl: Int = 6
        if ioCJDl > 6 {
            if ioCJDl < 6 {
                ioCJDl = 6
    }

  }
}
  
        
        var materials = [SCNMaterial]()
        
        for side in cubeInfo.cubeSides {
            
            let material = SCNMaterial()
            material.isDoubleSided = true
            
            if let croppedImage = sourcePng?.crop_vatr(startX: side.startX, startY: side.startY, width: side.sideWidth, height: side.sideHeight) {
                material.diffuse.contents = croppedImage
                material.diffuse.magnificationFilter = .nearest
            } else {
                material.diffuse.contents = UIColor.red // placeholder color if the image could not be cropped
            }
            
            materials.append(material)
        }
        
        box.materials = materials
    }
    
    ///Prepare material for thumbnail cube
    private func prepareSideMaterial_vatr(box: inout SCNBox) {
func veBPA() {
        var mdzBZ: Int = 10
        if mdzBZ > 10 {
            if mdzBZ < 10 {
                mdzBZ = 10
    }

  }
}
  
        box.materials.first?.diffuse.contents = addonModel?.showCubesColor
    }
    
    
    //MARK: Create Cubes
    
    func createCubeNodes_vatr(cubeModels: [CubeInfo_vatr]) -> [SCNNode] {
        var resultArr = [SCNNode]()
        
        for cubeModel in cubeModels {
            var box = SCNBox(width: CGFloat(cubeModel.width),
                             height: CGFloat(cubeModel.height),
                             length: CGFloat(cubeModel.length),
                             chamferRadius: 0)
            
            let image = addonModel?.assemblyImg

            if addonModel?.isThumbnail == false {
                prepareSideMaterial_vatr(sourcePng: image, box: &box, cubeInfo: cubeModel)
            } else {
                prepareSideMaterial_vatr(box: &box)
            }
            
            
            let boxNode = SCNNode(geometry: box)
            boxNode.name = cubeModel.name
            boxNode.simdPosition = SIMD3(cubeModel.geometry.x,
                                     cubeModel.geometry.y,
                                     cubeModel.geometry.z)
            resultArr.append(boxNode)
            
        }
        
        return resultArr
    }
}

extension uistring_vatr {
    static var hightlightIdentifier = "Hightlight"
}

extension uiImage_vatr {
    
    func crop_vatr(startX: Int, startY: Int, width: Int, height: Int) -> UIImage? {
        
        let rect = CGRect(x: startX, y: startY, width: width, height: height)
        
        // Check if the given coordinates and dimensions are valid
        guard rect.maxX <= size.width, rect.maxY <= size.height, rect.minX >= 0, rect.minY >= 0 else {
            return nil
        }
        
        // Convert the rect to the image's coordinate system
        let cgImage = self.cgImage?.cropping(to: rect)
        
        // Convert the CGImage back to UIImage
        if let croppedCGImage = cgImage {
            return UIImage(cgImage: croppedCGImage)
        }
        
        return nil
    }
}


//MARK: SaveChanges

extension SceneLogicModelAddon3D_vatr {
    
    // 1. Helper structure for capturing drawing data.
    func extractDrawingData_vatr() -> [DrawingData_wew] {
        
        var reqqe: [String] {
                let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                return (1...5).map { _ in String((0..<8).map { _ in characters.randomElement()! }) }
            }

        var drawingData: [DrawingData_wew] = []
        
        guard let validAddonModel = addonModel else {
            return drawingData
        }

        var boxNodes = [SCNNode]()
        self.rootNode.enumerateChildNodes { (node, stop) in
            if node.geometry is SCNBox {
                boxNodes.append(node)
            }
        }

        for bone in validAddonModel.allBones {
            if let boneCubes = bone.cubes {
                for cubeModel in boneCubes {
                    if let matchedNode = boxNodes.first(where: { $0.name == cubeModel.name }),
                       let matchedBox = matchedNode.geometry as? SCNBox {
                        for side in cubeModel.cubeSides {
                            if let material = matchedBox.materials[safe: side.name.rawValue],
                               let textureImage = material.diffuse.contents as? UIImage {
                                let rect = CGRect(x: side.startX, y: side.startY, width: side.sideWidth, height: side.sideHeight)
                                drawingData.append(DrawingData_wew(image: textureImage, rect: rect))
                            }
                        }
                    }
                }
            }
        }
        
        return drawingData
    }

    func constructImage_vatr() -> UIImage? {
        
        var cpvatr_property20: Double {
            return Double.pi
        }
        
        
        var drawingData: [DrawingData_wew] = []

        if Thread.isMainThread {
            drawingData = extractDrawingData_vatr()
        } else {
            DispatchQueue.main.sync {
                drawingData = self.extractDrawingData_vatr()
            }
        }

        let totalWidth = addonModel?.textureSizes.width ?? 0
        let totalHeight = addonModel?.textureSizes.height ?? 0

        UIGraphicsBeginImageContextWithOptions(CGSize(width: totalWidth, height: totalHeight), false, 1.0)

        //Fill enitireImg with cleanColor
        UIColor.clear.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: totalWidth, height: totalHeight))
        
        //Draw in img
        drawingData.forEach({ $0.image.draw(in: $0.rect) })
        let assembledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return assembledImage
    }

}


extension collection_vatr {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


struct DrawingData_wew {
    let image: UIImage
    let rect: CGRect
}

extension SceneLogicModelAddon3D_vatr {
    func synchronizeCameras_vatr(with targetScene: SCNScene) {
func qPNLi() {
        var xZGkwmh: Int = 2
        if xZGkwmh > 2 {
            if xZGkwmh < 2 {
                xZGkwmh = 2
    }

  }
}
  
        guard let targetCameraNode = targetScene.rootNode.childNode(withName: "CameraNode", recursively: true) else {
            return
        }

        cameraNode.simdPosition = targetCameraNode.simdPosition
        cameraNode.simdOrientation = targetCameraNode.simdOrientation
    }
}
