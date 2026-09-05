const NetworkCompilerUtils = {}

function NetworkCompilerUtils.unpack(...)
	return typeof(...) ~= "string"
		and table.unpack(...) 
		or ...
end

function NetworkCompilerUtils.pack(...)
	return {...}
end

export type utils = {
	unpack: ({any}) -> (any),
	pack: ({any}) -> ({any}),
}

return NetworkCompilerUtils :: utils
