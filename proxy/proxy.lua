local proxy = {properties = {}}

function proxy.property(property, callback)
	proxy.properties[property] = callback
end

local _set = go.set

function go.set(url, property, value, options)
	if proxy.properties[property] then
		proxy.properties[property](value, url)
	end
	
	_set(url, property, value, options)
end

proxy.go = go

return proxy