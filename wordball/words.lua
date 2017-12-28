local M = {}

local words = require "dictionaries.en"

local letters = ""
local frequencies = {}
local values = {}

function M.load(lang)
	if lang == "en" then
		for i=1,#words do
			words[words[i]] = true
		end
		letters = "bbbbbbbbbbbbbbbbbbbbcccccccccccccccccccccccccccccccccccccdddddddddddddddddddddddddddddddddddddddddddddddddddddddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffffffffggggggggggggggggggggggggggghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiizaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuvvvvvvvvvvvvvwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwxxyyyyyyyyyyyyyyyyyyyyyyyyyyjjkkkkkkkkkkllllllllllllllllllllllllllllllllllllllllllllllllllllllmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooppppppppppppppppppppppppppq"
		
		for i=1,#letters do
			local letter = letters:sub(i, i)
			frequencies[letter] = frequencies[letter] or 0
			frequencies[letter] = frequencies[letter] + 1
		end
		for letter,frequency in pairs(frequencies) do
			values[letter] = math.ceil(10 * (1 / math.sqrt(frequency)))
		end
	else
		error("Unknown language code " .. lang)
	end
end

function M.is_word(word)
	--print(words[word])
	return words[word]
end

function M.random_letter()
	local i = math.random(1, #letters)
	local letter = letters:sub(i, i)
	local value = M.value(letter)
	return letter, value
end

function M.value(letters)
	local v = 0
	for i=1,#letters do
		v = v + values[letters:sub(i, i)] or 1
	end
	return v
end


return M