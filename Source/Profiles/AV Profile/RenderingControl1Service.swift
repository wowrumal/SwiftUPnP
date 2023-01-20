import Foundation
import Combine
import XMLCoder

public class RenderingControl1Service: UPnPService {
	struct Envelope<T: Codable>: Codable {
		enum CodingKeys: String, CodingKey {
			case body = "s:Body"
		}

		var body: T
	}

	public enum A_ARG_TYPE_ChannelEnum: String, Codable {
		case master = "Master"
		case lf = "LF"
		case rf = "RF"
		case cf = "CF"
		case lfe = "LFE"
		case ls = "LS"
		case rs = "RS"
		case lfc = "LFC"
		case rfc = "RFC"
		case sd = "SD"
		case sl = "SL"
		case sr = "SR"
		case t = "T"
		case b = "B"
		case vendorDefined = "Vendor defined"
	}

	public enum A_ARG_TYPE_PresetNameEnum: String, Codable {
		case factoryDefaults = "FactoryDefaults"
		case installationDefaults = "InstallationDefaults"
		case vendorDefined = "Vendor defined"
	}

	public struct ListPresetsResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentPresetNameList = "CurrentPresetNameList"
		}

		public var currentPresetNameList: String
	}
	public func listPresets(instanceID: UInt32) async throws -> ListPresetsResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:ListPresets"
				case response = "u:ListPresetsResponse"
			}

			var action: SoapAction?
			var response: ListPresetsResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "ListPresets", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func selectPreset(instanceID: UInt32, presetName: A_ARG_TYPE_PresetNameEnum) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case presetName = "PresetName"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var presetName: A_ARG_TYPE_PresetNameEnum
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SelectPreset"
			}

			var action: SoapAction
		}
		try await post(action: "SelectPreset", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, presetName: presetName))))
	}

	public struct GetBrightnessResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentBrightness = "CurrentBrightness"
		}

		public var currentBrightness: UInt16
	}
	public func getBrightness(instanceID: UInt32) async throws -> GetBrightnessResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetBrightness"
				case response = "u:GetBrightnessResponse"
			}

			var action: SoapAction?
			var response: GetBrightnessResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetBrightness", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setBrightness(instanceID: UInt32, desiredBrightness: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredBrightness = "DesiredBrightness"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredBrightness: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetBrightness"
			}

			var action: SoapAction
		}
		try await post(action: "SetBrightness", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredBrightness: desiredBrightness))))
	}

	public struct GetContrastResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentContrast = "CurrentContrast"
		}

		public var currentContrast: UInt16
	}
	public func getContrast(instanceID: UInt32) async throws -> GetContrastResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetContrast"
				case response = "u:GetContrastResponse"
			}

			var action: SoapAction?
			var response: GetContrastResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetContrast", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setContrast(instanceID: UInt32, desiredContrast: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredContrast = "DesiredContrast"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredContrast: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetContrast"
			}

			var action: SoapAction
		}
		try await post(action: "SetContrast", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredContrast: desiredContrast))))
	}

	public struct GetSharpnessResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentSharpness = "CurrentSharpness"
		}

		public var currentSharpness: UInt16
	}
	public func getSharpness(instanceID: UInt32) async throws -> GetSharpnessResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetSharpness"
				case response = "u:GetSharpnessResponse"
			}

			var action: SoapAction?
			var response: GetSharpnessResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetSharpness", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setSharpness(instanceID: UInt32, desiredSharpness: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredSharpness = "DesiredSharpness"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredSharpness: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetSharpness"
			}

			var action: SoapAction
		}
		try await post(action: "SetSharpness", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredSharpness: desiredSharpness))))
	}

	public struct GetRedVideoGainResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentRedVideoGain = "CurrentRedVideoGain"
		}

		public var currentRedVideoGain: UInt16
	}
	public func getRedVideoGain(instanceID: UInt32) async throws -> GetRedVideoGainResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetRedVideoGain"
				case response = "u:GetRedVideoGainResponse"
			}

			var action: SoapAction?
			var response: GetRedVideoGainResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetRedVideoGain", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setRedVideoGain(instanceID: UInt32, desiredRedVideoGain: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredRedVideoGain = "DesiredRedVideoGain"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredRedVideoGain: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetRedVideoGain"
			}

			var action: SoapAction
		}
		try await post(action: "SetRedVideoGain", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredRedVideoGain: desiredRedVideoGain))))
	}

	public struct GetGreenVideoGainResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentGreenVideoGain = "CurrentGreenVideoGain"
		}

		public var currentGreenVideoGain: UInt16
	}
	public func getGreenVideoGain(instanceID: UInt32) async throws -> GetGreenVideoGainResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetGreenVideoGain"
				case response = "u:GetGreenVideoGainResponse"
			}

			var action: SoapAction?
			var response: GetGreenVideoGainResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetGreenVideoGain", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setGreenVideoGain(instanceID: UInt32, desiredGreenVideoGain: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredGreenVideoGain = "DesiredGreenVideoGain"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredGreenVideoGain: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetGreenVideoGain"
			}

			var action: SoapAction
		}
		try await post(action: "SetGreenVideoGain", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredGreenVideoGain: desiredGreenVideoGain))))
	}

	public struct GetBlueVideoGainResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentBlueVideoGain = "CurrentBlueVideoGain"
		}

		public var currentBlueVideoGain: UInt16
	}
	public func getBlueVideoGain(instanceID: UInt32) async throws -> GetBlueVideoGainResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetBlueVideoGain"
				case response = "u:GetBlueVideoGainResponse"
			}

			var action: SoapAction?
			var response: GetBlueVideoGainResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetBlueVideoGain", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setBlueVideoGain(instanceID: UInt32, desiredBlueVideoGain: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredBlueVideoGain = "DesiredBlueVideoGain"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredBlueVideoGain: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetBlueVideoGain"
			}

			var action: SoapAction
		}
		try await post(action: "SetBlueVideoGain", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredBlueVideoGain: desiredBlueVideoGain))))
	}

	public struct GetRedVideoBlackLevelResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentRedVideoBlackLevel = "CurrentRedVideoBlackLevel"
		}

		public var currentRedVideoBlackLevel: UInt16
	}
	public func getRedVideoBlackLevel(instanceID: UInt32) async throws -> GetRedVideoBlackLevelResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetRedVideoBlackLevel"
				case response = "u:GetRedVideoBlackLevelResponse"
			}

			var action: SoapAction?
			var response: GetRedVideoBlackLevelResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetRedVideoBlackLevel", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setRedVideoBlackLevel(instanceID: UInt32, desiredRedVideoBlackLevel: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredRedVideoBlackLevel = "DesiredRedVideoBlackLevel"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredRedVideoBlackLevel: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetRedVideoBlackLevel"
			}

			var action: SoapAction
		}
		try await post(action: "SetRedVideoBlackLevel", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredRedVideoBlackLevel: desiredRedVideoBlackLevel))))
	}

	public struct GetGreenVideoBlackLevelResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentGreenVideoBlackLevel = "CurrentGreenVideoBlackLevel"
		}

		public var currentGreenVideoBlackLevel: UInt16
	}
	public func getGreenVideoBlackLevel(instanceID: UInt32) async throws -> GetGreenVideoBlackLevelResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetGreenVideoBlackLevel"
				case response = "u:GetGreenVideoBlackLevelResponse"
			}

			var action: SoapAction?
			var response: GetGreenVideoBlackLevelResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetGreenVideoBlackLevel", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setGreenVideoBlackLevel(instanceID: UInt32, desiredGreenVideoBlackLevel: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredGreenVideoBlackLevel = "DesiredGreenVideoBlackLevel"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredGreenVideoBlackLevel: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetGreenVideoBlackLevel"
			}

			var action: SoapAction
		}
		try await post(action: "SetGreenVideoBlackLevel", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredGreenVideoBlackLevel: desiredGreenVideoBlackLevel))))
	}

	public struct GetBlueVideoBlackLevelResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentBlueVideoBlackLevel = "CurrentBlueVideoBlackLevel"
		}

		public var currentBlueVideoBlackLevel: UInt16
	}
	public func getBlueVideoBlackLevel(instanceID: UInt32) async throws -> GetBlueVideoBlackLevelResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetBlueVideoBlackLevel"
				case response = "u:GetBlueVideoBlackLevelResponse"
			}

			var action: SoapAction?
			var response: GetBlueVideoBlackLevelResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetBlueVideoBlackLevel", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setBlueVideoBlackLevel(instanceID: UInt32, desiredBlueVideoBlackLevel: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredBlueVideoBlackLevel = "DesiredBlueVideoBlackLevel"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredBlueVideoBlackLevel: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetBlueVideoBlackLevel"
			}

			var action: SoapAction
		}
		try await post(action: "SetBlueVideoBlackLevel", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredBlueVideoBlackLevel: desiredBlueVideoBlackLevel))))
	}

	public struct GetColorTemperatureResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentColorTemperature = "CurrentColorTemperature"
		}

		public var currentColorTemperature: UInt16
	}
	public func getColorTemperature(instanceID: UInt32) async throws -> GetColorTemperatureResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetColorTemperature"
				case response = "u:GetColorTemperatureResponse"
			}

			var action: SoapAction?
			var response: GetColorTemperatureResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetColorTemperature", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setColorTemperature(instanceID: UInt32, desiredColorTemperature: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredColorTemperature = "DesiredColorTemperature"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredColorTemperature: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetColorTemperature"
			}

			var action: SoapAction
		}
		try await post(action: "SetColorTemperature", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredColorTemperature: desiredColorTemperature))))
	}

	public struct GetHorizontalKeystoneResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentHorizontalKeystone = "CurrentHorizontalKeystone"
		}

		public var currentHorizontalKeystone: Int16
	}
	public func getHorizontalKeystone(instanceID: UInt32) async throws -> GetHorizontalKeystoneResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetHorizontalKeystone"
				case response = "u:GetHorizontalKeystoneResponse"
			}

			var action: SoapAction?
			var response: GetHorizontalKeystoneResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetHorizontalKeystone", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setHorizontalKeystone(instanceID: UInt32, desiredHorizontalKeystone: Int16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredHorizontalKeystone = "DesiredHorizontalKeystone"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredHorizontalKeystone: Int16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetHorizontalKeystone"
			}

			var action: SoapAction
		}
		try await post(action: "SetHorizontalKeystone", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredHorizontalKeystone: desiredHorizontalKeystone))))
	}

	public struct GetVerticalKeystoneResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentVerticalKeystone = "CurrentVerticalKeystone"
		}

		public var currentVerticalKeystone: Int16
	}
	public func getVerticalKeystone(instanceID: UInt32) async throws -> GetVerticalKeystoneResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetVerticalKeystone"
				case response = "u:GetVerticalKeystoneResponse"
			}

			var action: SoapAction?
			var response: GetVerticalKeystoneResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetVerticalKeystone", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setVerticalKeystone(instanceID: UInt32, desiredVerticalKeystone: Int16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case desiredVerticalKeystone = "DesiredVerticalKeystone"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var desiredVerticalKeystone: Int16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetVerticalKeystone"
			}

			var action: SoapAction
		}
		try await post(action: "SetVerticalKeystone", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, desiredVerticalKeystone: desiredVerticalKeystone))))
	}

	public struct GetMuteResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentMute = "CurrentMute"
		}

		public var currentMute: Bool
	}
	public func getMute(instanceID: UInt32, channel: A_ARG_TYPE_ChannelEnum) async throws -> GetMuteResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case channel = "Channel"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var channel: A_ARG_TYPE_ChannelEnum
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetMute"
				case response = "u:GetMuteResponse"
			}

			var action: SoapAction?
			var response: GetMuteResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetMute", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, channel: channel))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setMute(instanceID: UInt32, channel: A_ARG_TYPE_ChannelEnum, desiredMute: Bool) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case channel = "Channel"
				case desiredMute = "DesiredMute"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var channel: A_ARG_TYPE_ChannelEnum
			public var desiredMute: Bool
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetMute"
			}

			var action: SoapAction
		}
		try await post(action: "SetMute", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, channel: channel, desiredMute: desiredMute))))
	}

	public struct GetVolumeResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentVolume = "CurrentVolume"
		}

		public var currentVolume: UInt16
	}
	public func getVolume(instanceID: UInt32, channel: A_ARG_TYPE_ChannelEnum) async throws -> GetVolumeResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case channel = "Channel"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var channel: A_ARG_TYPE_ChannelEnum
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetVolume"
				case response = "u:GetVolumeResponse"
			}

			var action: SoapAction?
			var response: GetVolumeResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetVolume", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, channel: channel))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setVolume(instanceID: UInt32, channel: A_ARG_TYPE_ChannelEnum, desiredVolume: UInt16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case channel = "Channel"
				case desiredVolume = "DesiredVolume"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var channel: A_ARG_TYPE_ChannelEnum
			public var desiredVolume: UInt16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetVolume"
			}

			var action: SoapAction
		}
		try await post(action: "SetVolume", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, channel: channel, desiredVolume: desiredVolume))))
	}

	public struct GetVolumeDBResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentVolume = "CurrentVolume"
		}

		public var currentVolume: Int16
	}
	public func getVolumeDB(instanceID: UInt32, channel: A_ARG_TYPE_ChannelEnum) async throws -> GetVolumeDBResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case channel = "Channel"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var channel: A_ARG_TYPE_ChannelEnum
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetVolumeDB"
				case response = "u:GetVolumeDBResponse"
			}

			var action: SoapAction?
			var response: GetVolumeDBResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetVolumeDB", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, channel: channel))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setVolumeDB(instanceID: UInt32, channel: A_ARG_TYPE_ChannelEnum, desiredVolume: Int16) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case channel = "Channel"
				case desiredVolume = "DesiredVolume"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var channel: A_ARG_TYPE_ChannelEnum
			public var desiredVolume: Int16
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetVolumeDB"
			}

			var action: SoapAction
		}
		try await post(action: "SetVolumeDB", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, channel: channel, desiredVolume: desiredVolume))))
	}

	public struct GetVolumeDBRangeResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case minValue = "MinValue"
			case maxValue = "MaxValue"
		}

		public var minValue: Int16
		public var maxValue: Int16
	}
	public func getVolumeDBRange(instanceID: UInt32, channel: A_ARG_TYPE_ChannelEnum) async throws -> GetVolumeDBRangeResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case channel = "Channel"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var channel: A_ARG_TYPE_ChannelEnum
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetVolumeDBRange"
				case response = "u:GetVolumeDBRangeResponse"
			}

			var action: SoapAction?
			var response: GetVolumeDBRangeResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetVolumeDBRange", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, channel: channel))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public struct GetLoudnessResponse: Codable {
		enum CodingKeys: String, CodingKey {
			case currentLoudness = "CurrentLoudness"
		}

		public var currentLoudness: Bool
	}
	public func getLoudness(instanceID: UInt32, channel: A_ARG_TYPE_ChannelEnum) async throws -> GetLoudnessResponse {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case channel = "Channel"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var channel: A_ARG_TYPE_ChannelEnum
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:GetLoudness"
				case response = "u:GetLoudnessResponse"
			}

			var action: SoapAction?
			var response: GetLoudnessResponse?
		}
		let result: Envelope<Body> = try await postWithResult(action: "GetLoudness", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, channel: channel))))

		guard let response = result.body.response else { throw ServiceParseError.noValidResponse }
		return response
	}

	public func setLoudness(instanceID: UInt32, channel: A_ARG_TYPE_ChannelEnum, desiredLoudness: Bool) async throws {
		struct SoapAction: Codable {
			enum CodingKeys: String, CodingKey {
				case urn = "xmlns:u"
				case instanceID = "InstanceID"
				case channel = "Channel"
				case desiredLoudness = "DesiredLoudness"
			}

			@Attribute var urn: String
			public var instanceID: UInt32
			public var channel: A_ARG_TYPE_ChannelEnum
			public var desiredLoudness: Bool
		}
		struct Body: Codable {
			enum CodingKeys: String, CodingKey {
				case action = "u:SetLoudness"
			}

			var action: SoapAction
		}
		try await post(action: "SetLoudness", envelope: Envelope(body: Body(action: SoapAction(urn: Attribute(serviceType), instanceID: instanceID, channel: channel, desiredLoudness: desiredLoudness))))
	}

}

// Event parser
extension RenderingControl1Service {
	public struct State: Codable {
		enum CodingKeys: String, CodingKey {
			case lastChange = "LastChange"
		}

		public var lastChange: String?
	}

	public func state(xml: Data) throws -> State {
		struct PropertySet: Codable {
			var property: [State]
		}

		let decoder = XMLDecoder()
		decoder.shouldProcessNamespaces = true
		let propertySet = try decoder.decode(PropertySet.self, from: xml)

		return propertySet.property.reduce(State()) { partialResult, property in
			var result = partialResult
			if let lastChange = property.lastChange {
				result.lastChange = lastChange
			}
			return result
		}
	}

	public var stateSubject: AnyPublisher<State, Never> {
		subscribedEventPublisher
			.compactMap { [weak self] in
				guard let self else { return nil }

				return try? self.state(xml: $0)
			}
			.eraseToAnyPublisher()
	}
}