//
// WaifuPictureAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class WaifuPictureAPI {

    /**
     Get waifu image
     
     - parameter swfCategory: (path)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func getImageSource(swfCategory: SwfCategory, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: Source?, _ error: Error?) -> Void)) -> RequestTask {
        return getImageSourceWithRequestBuilder(swfCategory: swfCategory).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get waifu image
     - GET /sfw/{swf_category}
     - parameter swfCategory: (path)  
     - returns: RequestBuilder<Source> 
     */
    open class func getImageSourceWithRequestBuilder(swfCategory: SwfCategory) -> RequestBuilder<Source> {
        var localVariablePath = "/sfw/{swf_category}"
        let swfCategoryPreEscape = "\(APIHelper.mapValueToPathItem(swfCategory))"
        let swfCategoryPostEscape = swfCategoryPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{swf_category}", with: swfCategoryPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Source>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}