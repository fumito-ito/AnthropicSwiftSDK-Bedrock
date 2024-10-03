//
//  InvokeModelWithResponseStreamInput+Extension.swift
//  
//
//  Created by 伊藤史 on 2024/03/23.
//

import Foundation
import AnthropicSwiftSDK
import AWSBedrockRuntime

extension InvokeModelWithResponseStreamInput {
    /// Constructor for Bedrock invoke model stream input with Claude request object
    /// 
    /// - Parameters:
    ///   - accept: acceptable response content type
    ///   - request: Claude API request. It will be converted to `Data` and contained in bedrock request.
    ///   - contentType: acceptable request content type
    init(accept: String, request: MessagesRequest, contentType: String) throws {
        let data = try request.encode(
            with: ["anthropic_version": AnthropicBedrockClient.anthropicVersion],
            without: UnnecessaryParameter.allCases.map { $0.rawValue }
        )

        self.init(
            accept: accept,
            body: data,
            contentType: contentType,
            modelId: request.model.bedrockModelName
        )
    }
}
