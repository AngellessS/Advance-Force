local adf = {}

function info() 
return {
	version = "1.0",
	name = "adf.help.apiTool",
	language = "LuaGG",
	author = "TheAyonil",
	contacts = {
		Telegram = "https://t.me/TheAyonil",
		TGChannel = "https://t.me/theayonilchannel",
		YouTube = "https://youtube.com/@theayonil",
		Discord = "ayonil#7509",
	},
}
end

function string.split(inputstr, sep) --Separation string, return -> table
        if sep == nil or sep == "" then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function gg.newFolder(s) --Create folder
	local s = s 
	if s:sub(#s) ~= "/" then s = s.."/" end 
	s = s..".adf"
	gg.saveList(s)
	os.remove(s)
end

function gg.replaceFile(old,new) --Move file
	local stFile=io.open(old,"r"):read("*a") 
	io.open(new,"w"):write(stFile) 
	os.remove(old) 
	return stFile 
end

function gg.checkPath(dir) --Check dir exist, return -> bool(true/false)
	return os.rename(dir,dir) or false
end 

function adf.isRoot() --Check root device, return -> bool(true/false)
	local V = gg.CACHE_DIR
	V = V:gsub ("/data/data/.-/", function (t)
		t = t:gsub ("/data/data/","")
		t = t:gsub ("/",[[]])
		DATAPP = t
		return t
	end)
	if DATAPP == PACKAGE then 
		return true
	else 
		return false
	end
end

function adf.readLines(file_dir) --Read file lines, return -> table
	local array = {}
	for i,lines in io.lines(file_dir) do
		table.insert(array, i)
	end
	return array
end

function math.binToDec(binary) --Convert binary to decimal, return -> number
	local indexes = {}
	local count = 0
	for index, value in ipairs({binary:byte(1,-1)}) do
		indexes[count] = string.char(value)
		count = count + 1
	end
	local decimal = 0
	for i = 0,#indexes do
		decimal = decimal + (indexes[#indexes - i] * math.pow(2,i))
	end
	return decimal
end

function math.decToBin(decimal) --Convert decimal to binary, return -> string
	local indexes = {}
	local count = 0
	local binary = ""
	while true do
		indexes[count] = decimal % 2
		decimal = decimal // 2
		if decimal == 0 then
			break
		end
		count = count + 1
	end
	for i = 0,#indexes do
		binary = binary..tostring(indexes[#indexes - i])
	end
	return binary
end

function math.decToHex(decimal) --Convert decimal to hexadecimal, return -> string
	local indexes = {}
	local count = 0
	local hex = ""
	while true do
		indexes[count] = decimal % 16
		if indexes[count] == 10 then
			indexes[count] = "A"
		elseif indexes[count] == 11 then
			indexes[count] = "B"
		elseif indexes[count] == 12 then
			indexes[count] = "C"
		elseif indexes[count] == 13 then
			indexes[count] = "D"
		elseif indexes[count] == 14 then
			indexes[count] = "E"
		elseif indexes[count] == 15 then
			indexes[count] = "F"
		end
		decimal = decimal // 16
		if decimal == 0 then
			break
		end
		count = count + 1
	end
	for i = 0,#indexes do
		hex = hex..tostring(indexes[#indexes - i])
	end
	return hex
end

function math.hexToDec(hex) --Convert hexadecimal to decimal, return -> number
	return tonumber(hex, 16)
end

function math.hexToFloat(hex) --Convert hexadecimal to float, return -> float number
	local convert = "0x"..hex
	local s=string.pack("i4",convert)
	local float=string.unpack("f",s)
	return float
end

function math.decToFloat(decimal) --Convert decimal to float, return -> float number
	local hex = "0x"..math.decToHex(decimal)
	local s=string.pack("i4",hex)
	local float=string.unpack("f",s)
	return float
end

function math.floatToDec(float) --Convert float to decimal, return -> number
	local s = string.pack("f",float)
	local decimal = string.unpack("i4",s)
	return decimal
end

function math.floatToHex(float) --Convert float to hexadecimal, return -> string
	local s = string.pack("f",float)
	local decimal = string.unpack("i4",s)
	return math.decToHex(decimal)
end

function adf.memorySearch(Value, Type) 
	gg.setVisible(false) 
	gg.searchNumber(Value, Type) 
	gg.refineNumber(Value, Type) 
	result_ = {
    	gg.getResults(999999),
    	gg.getResultCount(),
	}
	SaanModz__1 = true
	SaanModz__2 = {}
	SaanModz__3 = {}
	SaanModz__4 = {}
	SaanModz__5 = {}
	SaanModz__6 = {}
	SaanModz__7 = {}
	if result_[2] > 999999 then
		result_[2] = 999999
	end
end

function adf.memoryOffset(Value, Offset, Type) 
	gg.setVisible(false) 
	if SaanModz__1 == true then
		table.insert(SaanModz__2, Value) 
		table.insert(SaanModz__3, Offset) 
		table.insert(SaanModz__4, Type) 
	end
end

function adf.memoryWrite(Value, Offset, Type) 
	gg.setVisible(false) 
	if SaanModz__1 == true then
		table.insert(SaanModz__5, Value) 
		table.insert(SaanModz__6, Offset) 
		table.insert(SaanModz__7, Type)
		for i = 1, result_[2] do
			for ii = 1, #SaanModz__2 do
				SaanModz_ = {}
    			SaanModz_[1] = {}
 		  	 SaanModz_[1]["address"] = result_[1][i]["address"] + load("return "..SaanModz__3[ii])()--ofset
    			SaanModz_[1]["flags"] = SaanModz__4[ii]
    			SaanModz = gg.getValues(SaanModz_)
    			if SaanModz[1].value == SaanModz__2[ii] then
    				if SaanModz__5[ii] ~= nil then
						gg.setValues({
            				[1] = {
        	    			address = load("return "..SaanModz[1].address)() ,
        			  	  flags = SaanModz__7[ii],
		 				   value = SaanModz__5[ii]
          				  }
       			   })
    				end
    			end
			end
		end
	end
end

function adf.memoryClear() 
	gg.clearResults() 
	SaanModz__1 = false
end

--return adf
