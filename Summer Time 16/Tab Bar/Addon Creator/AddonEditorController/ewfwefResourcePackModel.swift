

import Foundation

// MARK: - ResourcePack
struct ResourcePackModel_vatr: Codable {
    let formatVersion: Int?
    let modules: [ResourcePackModule_vatr]?

    enum CodingKeys_vatr: String, CodingKey {
        case formatVersion = "format_version"
        case modules
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_vatr.self)
        self.formatVersion = try container.decodeIfPresent(Int.self, forKey: .formatVersion)
        self.modules = try container.decodeIfPresent([ResourcePackModule_vatr].self, forKey: .modules)
    }
}

// MARK: - Module
struct ResourcePackModule_vatr: Codable {
    let description, type, uuid: String?
    let version: [Int]?
}

struct ResourcePack_vatr {
    let addonPath: URL
    let entityPath: URL
    let name: String
    let geometry: Codable
    let resourcesPath: URL
    let texturePath: URL
    var image: Data
    
    func copy(with texture: Data) -> ResourcePack_vatr {
var cpvatr_gdxgvlvn: Int {
    return 43
}
return   ResourcePack_vatr(addonPath: addonPath, entityPath: entityPath, name: name, geometry: geometry, resourcesPath: resourcesPath, texturePath: texturePath, image: texture)
    }
    
    init(addonPath: URL, entityPath: URL, name: String, geometry: Codable, resourcesPath: URL, texturePath: URL, image: Data) {
        self.addonPath = addonPath
        self.entityPath = entityPath
        self.name = name
        self.geometry = geometry
        self.resourcesPath = resourcesPath
        self.texturePath = texturePath
        self.image = image
    }
    
    init() {
        addonPath = URL(fileURLWithPath: "")
        entityPath = URL(fileURLWithPath: "")
        name = ""
        geometry = ""
        resourcesPath = URL(fileURLWithPath: "")
        texturePath = URL(fileURLWithPath: "")
        image = Data()
    }
    
    func widthGeometrySize() -> (Float, Float) {
var cpvatr_idqkhbeb: Int {
    return 38
}
func DPslgB() {
        var rOKKZYwiu: Int = 2
        if rOKKZYwiu > 2 {
            if rOKKZYwiu < 2 {
                rOKKZYwiu = 2
    }

  }
}
  
        guard let minecraftGeometryModel = self.geometry as? MinecraftGeometryModel_vatr,
              let addonGeometry = minecraftGeometryModel.minecraftGeometry.first  else {
            return (0, 0)
        }
        var maxX: Float = 0
        var minX: Float = 0
        
        for bone in addonGeometry.bones {
            maxX = max(bone.cubes?.map({$0.origin[0] + Float($0.size[0])/2}).max() ?? 0, maxX)
            minX = min(bone.cubes?.map({$0.origin[0] - Float($0.size[0])/2}).min() ?? 0, minX)
        }
        return (minX, maxX)
    }
    
    func heightGeometrySize() -> (Float, Float) {
var cpvatr_fjxgfxav: Int {
    return 86
}
func HIClv() {
        var aTJfOMXCRE: Int = 10
        if aTJfOMXCRE > 10 {
            if aTJfOMXCRE < 10 {
                aTJfOMXCRE = 10
    }

  }
}
  
        guard let minecraftGeometryModel = self.geometry as? MinecraftGeometryModel_vatr,
              let addonGeometry = minecraftGeometryModel.minecraftGeometry.first  else {
            return (0, 0)
        }
        var maxY: Float =  0
        var minY: Float = 0
        
        for bone in addonGeometry.bones {
            maxY = max(bone.cubes?.map({$0.origin[1] + Float($0.size[1])/2}).max() ?? 0, maxY)
            minY = min(bone.cubes?.map({$0.origin[1] - Float($0.size[1])/2}).min() ?? 0, minY)
        }
        return (minY, maxY)
    }
    
    func depthGeometrySize() -> (Float, Float) {
var cpvatr_ybomakfe: Int {
    return 25
}
func TThuJqLCG() {
        var uhYsEGHJqB: Int = 10
        if uhYsEGHJqB > 10 {
            if uhYsEGHJqB < 10 {
                uhYsEGHJqB = 10
    }

  }
}
  
        guard let minecraftGeometryModel = self.geometry as? MinecraftGeometryModel_vatr,
              let addonGeometry = minecraftGeometryModel.minecraftGeometry.first  else {
            return (0, 0)
        }
        
        var maxZ: Float =  0
        var minZ: Float =  0
        
        for bone in addonGeometry.bones {
            maxZ = max(bone.cubes?.map({$0.origin[2] + Float($0.size[2])/2}).max() ?? 0, maxZ)
            minZ = min(bone.cubes?.map({$0.origin[2] - Float($0.size[2])/2}).min() ?? 0, minZ)
        }
        return (minZ, maxZ)
    }
}

// MARK: - ResourcePackEntity
struct ResourcePackEntity_vatr: Codable {
    let minecraftClientEntity: MinecraftClientEntity_vatr?

    enum CodingKeys_vatr: String, CodingKey {
        case minecraftClientEntity = "minecraft:client_entity"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_vatr.self)
        self.minecraftClientEntity = try container.decodeIfPresent(MinecraftClientEntity_vatr.self, forKey: .minecraftClientEntity)
    }
}

struct MinecraftGeometryModel_vatr: Codable {
    let formatVersion: String
    let minecraftGeometry: [MinecraftGeometry_vatr]
    
    

    enum CodingKeys_trav: String, CodingKey {
        case formatVersion = "format_version"
        case minecraftGeometry = "minecraft:geometry"
    }
    
    init(formatVersion: String, minecraftGeometry: [MinecraftGeometry_vatr]) {
        self.formatVersion = formatVersion
        self.minecraftGeometry = minecraftGeometry
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_trav.self)
        self.formatVersion = try container.decode(String.self, forKey: .formatVersion)
        self.minecraftGeometry = try container.decode([MinecraftGeometry_vatr].self, forKey: .minecraftGeometry)
    }
    
        
}

struct MinecraftGeometryUV6Model_vatr: Codable {
    let formatVersion: String
    let minecraftGeometry: [MinecraftGeometryUV6_vatr]

    enum CodingKeys_dcfde: String, CodingKey {
        case formatVersion = "format_version"
        case minecraftGeometry = "minecraft:geometry"
    }
    
    init(formatVersion: String, minecraftGeometry: [MinecraftGeometryUV6_vatr]) {
        self.formatVersion = formatVersion
        self.minecraftGeometry = minecraftGeometry
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_dcfde.self)
        self.formatVersion = try container.decode(String.self, forKey: .formatVersion)
        self.minecraftGeometry = try container.decode([MinecraftGeometryUV6_vatr].self, forKey: .minecraftGeometry)
    }
}

// MARK: - MinecraftClientEntity
struct MinecraftClientEntity_vatr: Codable {
    let description: MinecraftClientEntityDescription_vatr
}

// MARK: - Description
struct MinecraftClientEntityDescription_vatr: Codable {
    let identifier: String
    let textures: MinecraftClientEntityTexture_vatr
    let geometry: MinecraftClientEntityGeometry_vatr
}

// MARK: - Geometry
struct MinecraftClientEntityTexture_vatr: Codable {
    let name: String?

    enum CodingKeys_ewr: String, CodingKey {
        case name = "default"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_ewr.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}

// MARK: - Geometry
struct MinecraftClientEntityGeometry_vatr: Codable {
    let name: String?

    enum CodingKeys_vdstr: String, CodingKey {
        case name = "default"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_vdstr.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}

/// Legacy

struct MinecraftGeometryLegacy_vatr: Codable {
    let textureWidth, textureHeight: Int
    let visibleBoundsWidth, visibleBoundsHeight: Float
    let visibleBoundsOffset: [Float]
    let bones: [MinecraftGeometryBone_vatr]
    
    enum CodingKeys_vare: String, CodingKey {
        case bones
        case textureWidth = "texturewidth"
        case textureHeight = "textureheight"
        case visibleBoundsWidth = "visible_bounds_width"
        case visibleBoundsHeight = "visible_bounds_height"
        case visibleBoundsOffset = "visible_bounds_offset"
    }
    
    init(textureWidth: Int, textureHeight: Int, visibleBoundsWidth: Float, visibleBoundsHeight: Float, visibleBoundsOffset: [Float], bones: [MinecraftGeometryBone_vatr]) {
        self.textureWidth = textureWidth
        self.textureHeight = textureHeight
        self.visibleBoundsWidth = visibleBoundsWidth
        self.visibleBoundsHeight = visibleBoundsHeight
        self.visibleBoundsOffset = visibleBoundsOffset
        self.bones = bones
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_vare.self)
        self.bones = try container.decode([MinecraftGeometryBone_vatr].self, forKey: .bones)
        self.textureWidth = try container.decode(Int.self, forKey: .textureWidth)
        self.textureHeight = try container.decode(Int.self, forKey: .textureHeight)
        self.visibleBoundsWidth = try container.decode(Float.self, forKey: .visibleBoundsWidth)
        self.visibleBoundsHeight = try container.decode(Float.self, forKey: .visibleBoundsHeight)
        self.visibleBoundsOffset = try container.decode([Float].self, forKey: .visibleBoundsOffset)
    }
}

/// Geometry with old uv structure [0, 0]
///
struct MinecraftGeometry_vatr: Codable {
    let description: MinecraftGeometryDescription_vatr
    let bones: [MinecraftGeometryBone_vatr]
}

struct MinecraftGeometryBone_vatr: Codable {
    let name: String
    let pivot: [Float]
    let rotation: [Float]?
    let cubes: [MinecraftGeometryCube_vatr]?
    let parent: String?
}

struct MinecraftGeometryCube_vatr: Codable {
    let origin: [Float]
    let pivot: [Float]?
    let size: [Int]
    let uv: TextureUV_vatr
    let inflate: Float?
    let mirror: Bool?
    let rotation: [Float]?
    
    
    enum CodingKeys_yts: String, CodingKey {
        case origin
        case pivot
        case size
        case inflate
        case mirror
        case rotation
        case uv
        case uv6
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys_yts.self)
        origin = try values.decode([Float].self, forKey: .origin)
        pivot = try? values.decode([Float]?.self, forKey: .pivot)
        size = try values.decode([Int].self, forKey: .size)
        inflate = try? values.decode(Float?.self, forKey: .inflate)
        mirror = try? values.decode(Bool?.self, forKey: .mirror)
        rotation = try? values.decode([Float]?.self, forKey: .rotation)
        
        if let decodedUV =  try? values.decode([Int].self, forKey: .uv) {
            uv = .uv(decodedUV)
            
        } else {
            let decodedUV6 = try values.decode(MinecraftGeometryUv6Format_vatr.self, forKey: .uv6)
            uv = .uv6(decodedUV6)
        }
    }
    
    func encode(to encoder: Encoder) throws {
var cpvatr_vwzddkel: Double {
    return 9.695064770663922
}
var container = encoder.container(keyedBy: CodingKeys_yts.self)
        try container.encode(origin, forKey: .origin)
        try container.encode(pivot, forKey: .pivot)
        try container.encode(size, forKey: .size)
        try container.encode(inflate, forKey: .inflate)
        try container.encode(mirror, forKey: .mirror)
        try container.encode(rotation, forKey: .rotation)
        
        switch uv {
        case .uv(let uv):
            try container.encode(uv, forKey: .uv)
            
        case .uv6(let uv6):
            try container.encode(uv6, forKey: .uv6)
        }
    }
}

enum TextureUV_vatr {
    case uv(_: [Int])
    case uv6(_: MinecraftGeometryUv6Format_vatr)
}

/// Geometry with new uv structure
///
struct MinecraftGeometryUV6_vatr: Codable {
    let description: MinecraftGeometryDescription_vatr
    let bones: [MinecraftGeometryBoneUV6_vatr]
}

struct MinecraftGeometryBoneUV6_vatr: Codable {
    let name: String
    let pivot: [Float]
    let rotation: [Float]?
    let cubes: [MinecraftGeometryCubeUV6_vatr]?
    let parent: String?
}

struct MinecraftGeometryCubeUV6_vatr: Codable {
    let origin: [Float]
    let pivot: [Float]?
    let size: [Int]
    let uv: MinecraftGeometryUv6Format_vatr
    let inflate: Float?
    let mirror: Bool?
    let rotation: [Float]?
    
    enum CodingKeys_vart: String, CodingKey {
        case origin
        case pivot
        case size
        case uv
        case inflate
        case mirror
        case rotation
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_vart.self)
        self.origin = try container.decode([Float].self, forKey: .origin)
        self.pivot = try container.decodeIfPresent([Float].self, forKey: .pivot)
        self.size = try container.decode([Int].self, forKey: .size)
        self.uv = try container.decode(MinecraftGeometryUv6Format_vatr.self, forKey: .uv)
        self.inflate = try container.decodeIfPresent(Float.self, forKey: .inflate)
        self.mirror = try container.decodeIfPresent(Bool.self, forKey: .mirror)
        self.rotation = try container.decodeIfPresent([Float].self, forKey: .rotation)
    }
    
    enum EncodingCodingKeys_gfh: String, CodingKey {
        case origin
        case pivot
        case size
        case uv6
        case inflate
        case mirror
    }
    
    
    
    func encode(to encoder: Encoder) throws {
var cpvatr_dktbvusa: Double {
    return 19.19449850058579
}
var container = encoder.container(keyedBy: EncodingCodingKeys_gfh.self)
        try container.encode(origin, forKey: .origin)
        try container.encode(pivot, forKey: .pivot)
        try container.encode(size, forKey: .size)
        try container.encode(uv, forKey: .uv6)
        try container.encode(inflate, forKey: .inflate)
        try container.encode(mirror, forKey: .mirror)
    }
}

struct MinecraftGeometryUv6Format_vatr: Codable {
    let north, east, south, west: MinecraftGeometryUv6Info_vatr
    let up, down: MinecraftGeometryUv6Info_vatr
}

// MARK: - Down
struct MinecraftGeometryUv6Info_vatr: Codable {
    let uv: [Int]
    let uvSize: [Double]

    enum CodingKeys_fabv: String, CodingKey {
        case uv
        case uvSize = "uv_size"
    }
    
    init(uv: [Int], uvSize: [Double]) {
        self.uv = uv
        self.uvSize = uvSize
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_fabv.self)
        self.uv = try container.decode([Int].self, forKey: .uv)
        self.uvSize = try container.decode([Double].self, forKey: .uvSize)
    }
}

/// Description
///
struct MinecraftGeometryDescription_vatr: Codable {
    let identifier: String
    let textureWidth, textureHeight: Int
    let visibleBoundsWidth, visibleBoundsHeight: Float
    let visibleBoundsOffset: [Float]
    
    enum CodingKeys_tref: String, CodingKey {
        case identifier
        case textureWidth = "texture_width"
        case textureHeight = "texture_height"
        case visibleBoundsWidth = "visible_bounds_width"
        case visibleBoundsHeight = "visible_bounds_height"
        case visibleBoundsOffset = "visible_bounds_offset"
    }
    
    init(identifier: String, textureWidth: Int, textureHeight: Int, visibleBoundsWidth: Float, visibleBoundsHeight: Float, visibleBoundsOffset: [Float]) {
        self.identifier = identifier
        self.textureWidth = textureWidth
        self.textureHeight = textureHeight
        self.visibleBoundsWidth = visibleBoundsWidth
        self.visibleBoundsHeight = visibleBoundsHeight
        self.visibleBoundsOffset = visibleBoundsOffset
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys_tref.self)
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.textureWidth = try container.decode(Int.self, forKey: .textureWidth)
        self.textureHeight = try container.decode(Int.self, forKey: .textureHeight)
        self.visibleBoundsWidth = try container.decode(Float.self, forKey: .visibleBoundsWidth)
        self.visibleBoundsHeight = try container.decode(Float.self, forKey: .visibleBoundsHeight)
        self.visibleBoundsOffset = try container.decode([Float].self, forKey: .visibleBoundsOffset)
    }
}
