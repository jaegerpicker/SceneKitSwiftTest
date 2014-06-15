// Playground - noun: a place where people can play

import Cocoa
import XCPlayground
import SceneKit
import QuartzCore


var str = "Hello, playground"

var test = 5

var test2 = 2

var test3 = test + test2

var sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
var scene = SCNScene()
sceneView.scene = scene
XCPShowView("The Scene View", sceneView)
sceneView.autoenablesDefaultLighting = true
var cam = SCNCamera()
var camNode = SCNNode()
camNode.camera = cam
camNode.position = SCNVector3(x: 0, y: 0, z: 3)
//camNode.transform = SCNMatrix4MakeRotation(-3.0, 1.0, 0.0, 0.0)

scene.rootNode.addChildNode(camNode)
let lightNode = SCNNode()
lightNode.light = SCNLight()
lightNode.light.type = SCNLightTypeOmni
lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
scene.rootNode.addChildNode(lightNode)
let ambientLightNode = SCNNode()
ambientLightNode.light = SCNLight()
ambientLightNode.light.type = SCNLightTypeAmbient
ambientLightNode.light.color = NSColor.darkGrayColor()
scene.rootNode.addChildNode(ambientLightNode)
let boxSide = 1.0
var box = SCNBox(width: boxSide, height: boxSide, length: boxSide, chamferRadius: 0.02)
var boxNode = SCNNode(geometry: box)
let material = SCNMaterial()
material.diffuse.contents = NSColor.blueColor()
material.specular.contents = NSColor.grayColor()
material.locksAmbientWithDiffuse = true

// set the material to the 3d object geometry
boxNode.geometry.firstMaterial = material


let animation: CABasicAnimation = CABasicAnimation(keyPath: "rotation")
animation.toValue = NSValue(SCNVector4: SCNVector4(x: 1, y: 1, z: 0, w: M_PI*2))
//animation.toValue = NSValue(SCNVector4: SCNVector4(x: 1, y: 1, z: 0, w: Float(M_PI)*2))
animation.duration = 5
animation.repeatCount = MAXFLOAT //repeat forever
boxNode.addAnimation(animation, forKey: nil)

scene.rootNode.addChildNode(boxNode)


