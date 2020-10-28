//
//  ModelDataHandler.swift
//  i3DDemo
//
//  Created by Hector on 28/10/20.
//  Copyright © 2020 Tuple. All rights reserved.
//

import Accelerate
import CoreImage
import Foundation
import TensorFlowLite
import UIKit


// MARK: - Information about the model file.
typealias FileInfo = (name: String, extension: String)

enum Model {
  static let file: FileInfo = (
    name: "converted", extension: "tflite"
  )
}

class ModelDataHandler {

    /// TensorFlow Lite `Interpreter` object for performing inference on a given model.
    private var interpreter: Interpreter
    
    init(threadCount: Int = 1) throws {
        // Construct the path to the model file.
        guard let modelPath = Bundle.main.path(forResource: Model.file.name, ofType: Model.file.extension)
        else {
          fatalError("Failed to load the model file with name: \(Model.file.name).")
        }

        // Specify the options for the `Interpreter`.
        var options = Interpreter.Options()
        options.threadCount = threadCount

        // Create the `Interpreter`.
        interpreter = try Interpreter(modelPath: modelPath, options: options, delegates: nil)
        try interpreter.allocateTensors()
      }
    
}
