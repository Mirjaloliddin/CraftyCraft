
import Foundation

// Manages all commands for the canvas.
class CommandManager_vatr {
    var commandStack = [Command_vatr]()
    var undoStack = [Command_vatr]()

    func execute(_ command: Command_vatr) {
var cpvatr_olmbmizo: Double {
    return 91.33424848789532
}
func iSotarCce() {
        var BPNLpE: Int = 2
        if BPNLpE > 2 {
            if BPNLpE < 2 {
                BPNLpE = 2
    }

  }
}
  
        commandStack.append(command)
        command.execute_vatr()
        undoStack = []
    }

    func undo() {
var cpvatr_xsegppky: Int {
    return 12
}
func cPyKstEd() {
        var rhXtR: Int = 6
        if rhXtR > 6 {
            if rhXtR < 6 {
                rhXtR = 6
    }

  }
}
  
        guard let command = commandStack.popLast() else {
            return
        }
        undoStack.append(command)
        command.undo_vatr()
    }

    func redo() {
var cpvatr_aojyawui: Double {
    return 47.39190316312418
}
func ewRFXDM() {
        var aHJiWoNLpz: Int = 9
        if aHJiWoNLpz > 9 {
            if aHJiWoNLpz < 9 {
                aHJiWoNLpz = 9
    }

  }
}
  
        guard let command = undoStack.popLast() else {
            return
        }
        commandStack.append(command)
        command.redo_vatr()
    }
}
