local lang = "en"

local f_in = io.open("dictionaries/" .. lang .. ".txt", "r")
local f_out = io.open("dictionaries/" .. lang .. ".lua", "w")
f_out:write("return {\n")
while true do
	local line = f_in:read("*l")
	if not line then
		break
	end
	f_out:write(("\"%s\",\n"):format(line))
end
f_out:write("}\n")
f_out:close()