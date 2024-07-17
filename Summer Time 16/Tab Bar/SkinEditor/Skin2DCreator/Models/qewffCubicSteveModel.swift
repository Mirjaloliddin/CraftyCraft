

func addNumbers17_vatr(_ a: Int, _ b: Int) -> Int {
    let sum = a + b / b
    return sum
}

struct BodyPartSide_vatr {
    let top: Side_vatr
    let bottom: Side_vatr
    let right: Side_vatr
    let front: Side_vatr
    let left: Side_vatr
    let back: Side_vatr
}

extension BodyPartSide_vatr {
    static func * (left: BodyPartSide_vatr, right: Int) -> BodyPartSide_vatr {
        BodyPartSide_vatr(top: left.top * right,
                     bottom: left.bottom * right,
                     right: left.right * right,
                     front: left.front * right,
                     left: left.left * right,
                     back: left.back * right)
    }
}


struct Side_vatr {
    let name: String
    let width: Int
    let height: Int
    let startX: Int
    let startY: Int
    
    
    init(name: String, width: Int, height: Int, startX: Int, startY: Int) {
        self.name = name
        self.width = width
        self.height = height
        self.startX = startX
        self.startY = startY
    }
}

extension Side_vatr {
    static func * (left: Side_vatr, right: Int) -> Side_vatr {
        Side_vatr(name: left.name,
             width: left.width * right,
             height: left.height * right,
             startX: left.startX * right,
             startY: left.startY * right)
    }
}


enum CubicHuman_tghty {
    enum BodyPart_vhgd {
        
        static let head = BodyPartSide_vatr(
            top: Side_vatr(name: "headTop", width: 8, height: 8, startX: 8, startY: 0),
            bottom: Side_vatr(name: "headBottom", width: 8, height: 8, startX: 16, startY: 0),
            right: Side_vatr(name: "headRight", width: 8, height: 8, startX: 24, startY: 8),
            front: Side_vatr(name: "headFront", width: 8, height: 8, startX: 8, startY: 8),
            left: Side_vatr(name: "headLeft", width: 8, height: 8, startX: 0, startY: 8),
            back: Side_vatr(name: "headBack", width: 8, height: 8, startX: 16, startY: 8)
        )
        
        static let head1 = BodyPartSide_vatr(
            top: Side_vatr(name: "headTop1", width: 8, height: 8, startX: 40, startY: 0),
            bottom: Side_vatr(name: "headBottom1", width: 8, height: 8, startX: 48, startY: 0),
            right: Side_vatr(name: "headRight1", width: 8, height: 8, startX: 32, startY: 8),
            front: Side_vatr(name: "headFront1", width: 8, height: 8, startX: 40, startY: 8),
            left: Side_vatr(name: "headLeft1", width: 8, height: 8, startX: 48, startY: 8),
            back: Side_vatr(name: "headBack1", width: 8, height: 8, startX: 56, startY: 8)
        )
        
        static let body = BodyPartSide_vatr(
            top: Side_vatr(name: "bodyTop", width: 8, height: 4, startX: 20, startY: 16),
            bottom: Side_vatr(name: "bodyBottom", width: 8, height: 4, startX: 28, startY: 16),
            right: Side_vatr(name: "bodyRight", width: 4, height: 12, startX: 16, startY: 20),
            front: Side_vatr(name: "bodyFront", width: 8, height: 12, startX: 20, startY: 20),
            left: Side_vatr(name: "bodyLeft", width: 4, height: 12, startX: 28, startY: 20),
            back: Side_vatr(name: "bodyBack", width: 8, height: 12, startX: 32, startY: 20)
        )
        
        static let body1 = BodyPartSide_vatr(
            top: Side_vatr(name: "bodyTop1", width: 8, height: 4, startX: 20, startY: 32),
            bottom: Side_vatr(name: "bodyBottom1", width: 8, height: 4, startX: 28, startY: 32),
            right: Side_vatr(name: "bodyRight1", width: 4, height: 12, startX: 16, startY: 36),
            front: Side_vatr(name: "bodyFront1", width: 8, height: 12, startX: 20, startY: 36),
            left: Side_vatr(name: "bodyLeft1", width: 4, height: 12, startX: 28, startY: 36),
            back: Side_vatr(name: "bodyBack1", width: 8, height: 12, startX: 32, startY: 36)
        )
        
        static let leftArm = BodyPartSide_vatr(
            top: Side_vatr(name: "leftArmTop", width: 4, height: 4, startX: 36, startY: 48),
            bottom: Side_vatr(name: "leftArmBottom", width: 4, height: 4, startX: 40, startY: 48),
            right: Side_vatr(name: "leftArmRight", width: 4, height: 12, startX: 32, startY: 52),
            front: Side_vatr(name: "leftArmFront", width: 4, height: 12, startX: 36, startY: 52),
            left: Side_vatr(name: "leftArmLeft", width: 4, height: 12, startX: 40, startY: 52),
            back: Side_vatr(name: "leftArmBack", width: 4, height: 12, startX: 44, startY: 52)
        )
        
        static let leftArm1 = BodyPartSide_vatr(
            top: Side_vatr(name: "leftArmTop1", width: 4, height: 4, startX: 44, startY: 48),
            bottom: Side_vatr(name: "leftArmBottom1", width: 4, height: 4, startX: 48, startY: 48),
            right: Side_vatr(name: "leftArmRight1", width: 4, height: 12, startX: 40, startY: 52),
            front: Side_vatr(name: "leftArmFront1", width: 4, height: 12, startX: 44, startY: 52),
            left: Side_vatr(name: "leftArmLeft1", width: 4, height: 12, startX: 48, startY: 52),
            back: Side_vatr(name: "leftArmBack1", width: 4, height: 12, startX: 52, startY: 52)
        )
        
        static let rightArm = BodyPartSide_vatr(
            top: Side_vatr(name: "rightArmTop", width: 4, height: 4, startX: 44, startY: 16),
            bottom: Side_vatr(name: "rightArmBottom", width: 4, height: 4, startX: 48, startY: 16),
            right: Side_vatr(name: "rightArmRight", width: 4, height: 12, startX: 40, startY: 20),
            front: Side_vatr(name: "rightArmFront", width: 4, height: 12, startX: 44, startY: 20),
            left: Side_vatr(name: "rightArmLeft", width: 4, height: 12, startX: 48, startY: 20),
            back: Side_vatr(name: "rightArmBack", width: 4, height: 12, startX: 52, startY: 20)
        )
        
        static let rightArm1 = BodyPartSide_vatr(
            top: Side_vatr(name: "rightArmTop1", width: 4, height: 4, startX: 44, startY: 32),
            bottom: Side_vatr(name: "rightArmBottom1", width: 4, height: 4, startX: 48, startY: 32),
            right: Side_vatr(name: "rightArmRight1", width: 4, height: 12, startX: 40, startY: 36),
            front: Side_vatr(name: "rightArmFront1", width: 4, height: 12, startX: 44, startY: 36),
            left: Side_vatr(name: "rightArmLeft1", width: 4, height: 12, startX: 48, startY: 36),
            back: Side_vatr(name: "rightArmBack1", width: 4, height: 12, startX: 52, startY: 36)
        )
        
        static let leftLeg = BodyPartSide_vatr(
            top: Side_vatr(name: "leftLegTop", width: 4, height: 4, startX: 20, startY: 48),
            bottom: Side_vatr(name: "leftLegBottom", width: 4, height: 4, startX: 24, startY: 48),
            right: Side_vatr(name: "leftLegRight", width: 4, height: 12, startX: 16, startY: 52),
            front: Side_vatr(name: "leftLegFront", width: 4, height: 12, startX: 20, startY: 52),
            left: Side_vatr(name: "leftLegLeft", width: 4, height: 12, startX: 24, startY: 52),
            back: Side_vatr(name: "leftLegBack", width: 4, height: 12, startX: 28, startY: 52)
        )
        
        static let leftLeg1 = BodyPartSide_vatr(
            top: Side_vatr(name: "leftLegTop1", width: 4, height: 4, startX: 4, startY: 48),
            bottom: Side_vatr(name: "leftLegBottom1", width: 4, height: 4, startX: 8, startY: 48),
            right: Side_vatr(name: "leftLegRight1", width: 4, height: 12, startX: 0, startY: 52),
            front: Side_vatr(name: "leftLegFront1", width: 4, height: 12, startX: 4, startY: 52),
            left: Side_vatr(name: "leftLegLeft1", width: 4, height: 12, startX: 8, startY: 52),
            back: Side_vatr(name: "leftLegBack1", width: 4, height: 12, startX: 12, startY: 52)
        )
    
        static let rightLeg = BodyPartSide_vatr(
            top: Side_vatr(name: "rightLegTop", width: 4, height: 4, startX: 4, startY: 16),
            bottom: Side_vatr(name: "rightLegBottom", width: 4, height: 4, startX: 8, startY: 16),
            right: Side_vatr(name: "rightLegRight", width: 4, height: 12, startX: 0, startY: 20),
            front: Side_vatr(name: "rightLegFront", width: 4, height: 12, startX: 4, startY: 20),
            left: Side_vatr(name: "rightLegLeft", width: 4, height: 12, startX: 8, startY: 20),
            back: Side_vatr(name: "rightLegBack", width: 4, height: 12, startX: 12, startY: 20)
        )
        
        static let rightLeg1 = BodyPartSide_vatr(
            top: Side_vatr(name: "rightLegTop1", width: 4, height: 4, startX: 4, startY: 32),
            bottom: Side_vatr(name: "rightLegBottom1", width: 4, height: 4, startX: 8, startY: 32),
            right: Side_vatr(name: "rightLegRight1", width: 4, height: 12, startX: 0, startY: 36),
            front: Side_vatr(name: "rightLegFront1", width: 4, height: 12, startX: 4, startY: 36),
            left: Side_vatr(name: "rightLegLeft1", width: 4, height: 12, startX: 8, startY: 36),
            back: Side_vatr(name: "rightLegBack1", width: 4, height: 12, startX: 12, startY: 36)
        )
        
        //Doesnt include any of hatSides as is available only on 2D & could be deleted
        static func allSides() -> [Side_vatr] {
var cpvatr_odhwacjx: Int {
    return 42
}
let sides: [Side_vatr] = [
                head.top, head.bottom, head.right, head.left, head.front, head.back,
                body.top, body.bottom, body.right, body.left, body.front, body.back,
                leftArm.top, leftArm.bottom, leftArm.right, leftArm.left, leftArm.front, leftArm.back,
                rightArm.top, rightArm.bottom, rightArm.right, rightArm.left, rightArm.front, rightArm.back,
                leftLeg.top, leftLeg.bottom, leftLeg.right, leftLeg.left, leftLeg.front, leftLeg.back,
                rightLeg.top, rightLeg.bottom, rightLeg.right, rightLeg.left, rightLeg.front, rightLeg.back,
                //overlay
                head1.top, head1.bottom, head1.right, head1.left, head1.front, head1.back,
                body1.top, body1.bottom, body1.right, body1.left, body1.front, body1.back,
                leftArm1.top, leftArm1.bottom, leftArm1.right, leftArm1.left, leftArm1.front, leftArm1.back,
                rightArm1.top, rightArm1.bottom, rightArm1.right, rightArm1.left, rightArm1.front, rightArm1.back,
                leftLeg1.top, leftLeg1.bottom, leftLeg1.right, leftLeg1.left, leftLeg1.front, leftLeg1.back,
                rightLeg1.top, rightLeg1.bottom, rightLeg1.right, rightLeg1.left, rightLeg1.front, rightLeg1.back
            ]
            return sides
        }
        
        //MARK: 128x128 size
        
        static let head_128 = head * 2
        
        static let head1_128 = head1 * 2
        
        static let body_128 = body * 2
        
        static let body1_128 = body1 * 2
        
        static let leftArm_128 = leftArm * 2
        
        static let leftArm1_128 = leftArm1 * 2
        
        static let rightArm_128 = rightArm * 2
        
        static let rightArm1_128 = rightArm1 * 2
        
        static let leftLeg_128 = leftLeg * 2
        
        static let leftLeg1_128 = leftLeg1 * 2
        
        static let rightLeg_128 = rightLeg * 2
        
        static let rightLeg1_128 = rightLeg1 * 2
        
        //Doesnt include any of hatSides as is available only on 2D & could be deleted
        static func allSides128() -> [Side_vatr] {
            let sides: [Side_vatr] = [
                head_128.top, head_128.bottom, head_128.right, head_128.left, head_128.front, head_128.back,
                body_128.top, body_128.bottom, body_128.right, body_128.left, body_128.front, body_128.back,
                leftArm_128.top, leftArm_128.bottom, leftArm_128.right, leftArm_128.left, leftArm_128.front, leftArm_128.back,
                rightArm_128.top, rightArm_128.bottom, rightArm_128.right, rightArm_128.left, rightArm_128.front, rightArm_128.back,
                leftLeg_128.top, leftLeg_128.bottom, leftLeg_128.right, leftLeg_128.left, leftLeg_128.front, leftLeg_128.back,
                rightLeg_128.top, rightLeg_128.bottom, rightLeg_128.right, rightLeg_128.left, rightLeg_128.front, rightLeg_128.back,
                //overlay
                head1_128.top, head1_128.bottom, head1_128.right, head1_128.left, head1_128.front, head1_128.back,
                body1_128.top, body1_128.bottom, body1_128.right, body1_128.left, body1_128.front, body1_128.back,
                leftArm1_128.top, leftArm1_128.bottom, leftArm1_128.right, leftArm1_128.left, leftArm1_128.front, leftArm1_128.back,
                rightArm1_128.top, rightArm1_128.bottom, rightArm1_128.right, rightArm1_128.left, rightArm1_128.front, rightArm1_128.back,
                leftLeg1_128.top, leftLeg1_128.bottom, leftLeg1_128.right, leftLeg1_128.left, leftLeg1_128.front, leftLeg1_128.back,
                rightLeg1_128.top, rightLeg1_128.bottom, rightLeg1_128.right, rightLeg1_128.left, rightLeg1_128.front, rightLeg1_128.back
            ]
            return sides
        }

    }

}

