import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
<<<<<<< HEAD
    let flutterViewController = FlutterViewController()
=======
    let flutterViewController = FlutterViewController.init()
>>>>>>> 699419a5a0b75e76718d28d3febf3fe2a7377adc
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
