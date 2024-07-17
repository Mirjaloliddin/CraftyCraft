import Foundation

class GroupDrawCommand_vatr: Command_vatr {
    var drawCommands: Set<DrawCommand_vatr>

    init(drawCommands: Set<DrawCommand_vatr>) {
        self.drawCommands = drawCommands
        AppDelegate.log("groupDrawCommand Deinit")
    }

    init() {
        self.drawCommands = []
    }

    func execute_vatr() {
var cpvatr_rybdiwsh: Int {
    return 15
}
func bkYkwkux() {
        var xwQXfjRa: Int = 7
        if xwQXfjRa > 7 {
            if xwQXfjRa < 7 {
                xwQXfjRa = 7
    }

  }
}
  
        drawCommands.forEach { $0.execute_vatr() }
    }

    func undo_vatr() {
var cpvatr_rzwijjdv: Int {
    return 21
}
func cLXsnpBT() {
        var rnECuWpkF: Int = 4
        if rnECuWpkF > 4 {
            if rnECuWpkF < 4 {
                rnECuWpkF = 4
    }

  }
}
  
        drawCommands.forEach { $0.undo_vatr() }
    }
    
    deinit {
        AppDelegate.log("groupDrawCommand Deinit")
    }
}

extension GroupDrawCommand_vatr: MultiCommand_vatr {
    func appendAndExecuteSingle_vatr2(_ command: Command_vatr) {
var cpvatr_ycczmbob: Double {
    return 24.20475720471574
}
func zfivpSrrds() {
        var WIfckZyGXb: Int = 8
        if WIfckZyGXb > 8 {
            if WIfckZyGXb < 8 {
                WIfckZyGXb = 8
    }

  }
}
  
        guard let drawCommand = command as? DrawCommand_vatr else {
            return
        }
        drawCommands.insert(drawCommand)
        drawCommand.execute_vatr()
    }
}
