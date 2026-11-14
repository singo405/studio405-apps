import AppKit
import ImageIO
import UniformTypeIdentifiers
import CoreText

// Exact screenshot compositing for the approved Skytree concept; coordinates use top-left origin.
let args = CommandLine.arguments
precondition(args.count == 4 || args.count == 5, "Usage: swift render-gcamera-hero.swift <approved-banner.png> <actual-ui.png> <output.png> [ja|en]")
func load(_ path: String) -> CGImage {
    let source = CGImageSourceCreateWithURL(URL(fileURLWithPath: path) as CFURL, nil)!
    return CGImageSourceCreateImageAtIndex(source, 0, nil)!
}
func context(_ width: Int, _ height: Int) -> CGContext {
    let c = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: width * 4,
        space: CGColorSpace(name: CGColorSpace.sRGB)!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
    c.translateBy(x: 0, y: CGFloat(height)); c.scaleBy(x: 1, y: -1)
    c.interpolationQuality = .high
    return c
}
func draw(_ image: CGImage, _ rect: CGRect, _ c: CGContext) {
    c.saveGState(); c.translateBy(x: rect.minX, y: rect.maxY); c.scaleBy(x: 1, y: -1)
    c.draw(image, in: CGRect(origin: .zero, size: rect.size)); c.restoreGState()
}
func round(_ rect: CGRect, _ radius: CGFloat) -> CGPath {
    CGPath(roundedRect: rect, cornerWidth: radius, cornerHeight: radius, transform: nil)
}
func save(_ image: CGImage, _ path: String) {
    let dest = CGImageDestinationCreateWithURL(URL(fileURLWithPath: path) as CFURL, UTType.png.identifier as CFString, 1, nil)!
    CGImageDestinationAddImage(dest, image, nil); precondition(CGImageDestinationFinalize(dest))
}
let banner = load(args[1]), sourceUI = load(args[2])
precondition(banner.width == 1672 && banner.height == 941)
precondition(sourceUI.width == 1206 && sourceUI.height == 2622)
let preview = CGRect(x: 0, y: 336, width: 1206, height: 1608)
// Use only the photograph from the approved concept. Align its existing vertical grid, repair the old horizontal grid using neighbouring
// photo pixels, then reuse the exact grid pixels from the real UI.
let photoRect = CGRect(x: 477, y: 143, width: 360, height: 551)
let photo = banner.cropping(to: photoRect)!
let pc = context(photo.width, photo.height)
draw(photo, CGRect(x: 0, y: 0, width: photo.width, height: photo.height), pc)
let pixels = pc.data!.assumingMemoryBound(to: UInt8.self), stride = pc.bytesPerRow
// Bitmap rows follow the top-left image coordinates used by the flipped context.
func index(_ x: Int, _ y: Int) -> Int { y * stride + x * 4 }
// Keep the existing vertical grid centred at x=180 so the exact screenshot grid covers it.
// Only the old horizontal line moves when changing the photo crop to 3:4.
let old = Array(UnsafeBufferPointer(start: pixels, count: stride * photo.height))
for y in 278...282 {
    let t = Double(y - 277) / 6.0
    for x in 0..<photo.width {
        for channel in 0..<3 { pixels[index(x,y)+channel] = UInt8((Double(old[index(x,277)+channel])*(1-t) + Double(old[index(x,283)+channel])*t).rounded()) }
    }
}
let cleanPhoto = pc.makeImage()!
let ui = context(1206, 2622)
draw(sourceUI, CGRect(x: 0, y: 0, width: 1206, height: 2622), ui)
// A top-aligned 3:4 crop preserves the Skytree tip. The photograph is never stretched.
ui.saveGState(); ui.clip(to: preview)
draw(cleanPhoto, CGRect(x: 0.0, y: 336.0, width: 1206.0, height: CGFloat(photo.height) * 1206 / CGFloat(photo.width)), ui)
ui.restoreGState()
// Copy the real screenshot's cross strips (not a redraw of the control or grid).
let vertical = CGRect(x: 600, y: 336, width: 6, height: 1608)
let horizontal = CGRect(x: 0, y: 1137, width: 1206, height: 6)
for strip in [vertical, horizontal] { draw(sourceUI.cropping(to: strip)!, strip, ui) }
let exactUI = ui.makeImage()!
// Assert screenshot UI pixels outside the photo region survive composition unchanged.
let original = context(1206, 2622); draw(sourceUI, CGRect(x:0,y:0,width:1206,height:2622), original)
let a = original.data!.assumingMemoryBound(to: UInt8.self), b = ui.data!.assumingMemoryBound(to: UInt8.self)
for row in 0..<2622 {
    let topY = row
    if topY >= 336 && topY < 1944 { continue }
    for byte in 0..<(1206*4) { precondition(a[row*1206*4+byte] == b[row*1206*4+byte], "UI pixels changed outside photograph") }
}
let canvas = context(banner.width, banner.height)
draw(banner, CGRect(x: 0, y: 0, width: banner.width, height: banner.height), canvas)
// Cover the generated screen; retain the approved physical device frame.
canvas.setFillColor(CGColor(gray: 0, alpha: 1)); canvas.addPath(round(CGRect(x: 462,y: 50,width: 384,height: 838),44));canvas.fillPath()
let scale: CGFloat = 0.31
let screen = CGRect(x: 468,y: 62,width: 1206*scale,height: 2622*scale)
canvas.saveGState(); canvas.addPath(round(screen, 37)); canvas.clip(); draw(exactUI,screen,canvas);canvas.restoreGState()
// Physical Dynamic Island mockup; app controls and status icons remain sourced from the screenshot.
let island = CGRect(x: screen.midX-52,y: screen.minY+12,width:104,height:29)
canvas.setFillColor(CGColor(gray:0.015,alpha:1));canvas.addPath(round(island,14.5));canvas.fillPath()
canvas.setStrokeColor(CGColor(gray:0.12,alpha:1));canvas.setLineWidth(0.7);canvas.addPath(round(island,14.5));canvas.strokePath()
if args.count == 5 && args[4] == "en" {
    canvas.setFillColor(CGColor(gray: 1, alpha: 1))
    canvas.fill(CGRect(x: 915, y: 0, width: 757, height: 941))
    func text(_ value: String, x: CGFloat, y: CGFloat, size: CGFloat, bold: Bool) {
        let font = NSFont.systemFont(ofSize: size, weight: bold ? .bold : .regular)
        let attrs: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key(kCTFontAttributeName as String): CTFontCreateWithName(font.fontName as CFString, size, nil),
            NSAttributedString.Key(kCTForegroundColorAttributeName as String): bold ? CGColor(srgbRed: 7/255, green: 26/255, blue: 58/255, alpha: 1) : CGColor(gray: 0.23, alpha: 1)
        ]
        let line = CTLineCreateWithAttributedString(NSAttributedString(string: value, attributes: attrs))
        precondition(CTLineGetTypographicBounds(line, nil, nil, nil) <= 650, "Text exceeds panel")
        canvas.saveGState();canvas.textMatrix = CGAffineTransform(scaleX: 1, y: -1)
        canvas.textPosition = CGPoint(x: x, y: y+font.ascender);CTLineDraw(line, canvas);canvas.restoreGState()
    }
    for (i,line) in ["5 grids.","Your own","composition."].enumerated() {text(line,x:981,y:220+CGFloat(i)*106,size:82,bold:true)}
    text("Swipe to switch grids.",x:981,y:608,size:29,bold:false)
    text("Shoot square photos or save with the grid.",x:981,y:656,size:29,bold:false)
}
save(canvas.makeImage()!,args[3])
print("PASS: source UI pixels outside preview are unchanged; preview 1206×1608 (3:4); uniform screen scale \(scale)")
print(args[3])
