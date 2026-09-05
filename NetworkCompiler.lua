const NetworkCompiler = {}
NetworkCompiler._networks = {}
NetworkCompiler.__index = NetworkCompiler

const RunService = game:GetService("RunService")

const Networker = require("@game/Workspace/NetworkCompiler/Networker") -- Change to path.
const NetworkCompilerUtils = require("@self/NetworkCompilerUtils")

function NetworkCompiler.new(...)
	const packed = NetworkCompilerUtils.pack(...)
	
	local self = {
		networkTag = packed[1],
		network = packed[2],
		fn = packed[3] or {}
	} :: new
	
	self = setmetatable(self, NetworkCompiler)
	
	self.Network = RunService:IsServer()
		and Networker.server.new(
			self.networkTag,
			self.network,
			self.fn) 
		
		or Networker.client.new(
			self.networkTag,
			self.network)
	
	NetworkCompiler._networks = self
	return self.Network
end

export type new = {
	networkTag: string,
	network: {any},
	fn: {any?}
}

return NetworkCompiler :: {
	new: (networkTag: string, network: {any}, fn: {any}, networkType: string) -> {},
}
