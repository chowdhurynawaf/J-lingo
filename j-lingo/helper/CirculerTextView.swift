import UIKit

class CircularTextView: UIView {
    
    enum RotationDirection {
        case clockwise
        case counterclockwise
    }
    
    struct Layer {
        var texts: [String]
        var radius: CGFloat
        var rotationAngle: CGFloat = 0
        var rotationSpeed: CGFloat // Speed of rotation
        var font: UIFont // Font for this layer
        var textColor: UIColor // Color for this layer
        var alpha: CGFloat // Alpha for this layer
        var direction: RotationDirection // Direction of rotation
    }
    
    var layers: [Layer] = [] {
        didSet {
            self.setNeedsDisplay() // Redraw when layers are set
        }
    }
    
    private var displayLink: CADisplayLink?

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        for layer in layers {
            let textLength = layer.texts.count
            let angleIncrement = (2 * CGFloat.pi) / CGFloat(textLength)

            for (index, text) in layer.texts.enumerated() {
                let angle = angleIncrement * CGFloat(index) + layer.rotationAngle
                let x = center.x + layer.radius * cos(angle)
                let y = center.y + layer.radius * sin(angle)

                let attributes: [NSAttributedString.Key: Any] = [
                    .font: layer.font,
                    .foregroundColor: layer.textColor.withAlphaComponent(layer.alpha)
                ]

                let textSize = text.size(withAttributes: attributes)

                let textRect = CGRect(x: x - textSize.width / 2, y: y - textSize.height / 2, width: textSize.width, height: textSize.height)
                text.draw(in: textRect, withAttributes: attributes)
            }
        }
        
        context?.restoreGState()
    }
    
    func startRotating() {
        displayLink = CADisplayLink(target: self, selector: #selector(updateRotation))
        displayLink?.add(to: .main, forMode: .common)
    }
    
    func stopRotating() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    @objc private func updateRotation() {
        for index in layers.indices {
            let layer = layers[index]
            let speed = layer.direction == .clockwise ? layer.rotationSpeed : -layer.rotationSpeed
            layers[index].rotationAngle += speed
        }
        self.setNeedsDisplay() // Redraw the text with the updated angles
    }
}

