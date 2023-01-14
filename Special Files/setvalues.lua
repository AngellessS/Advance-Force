function setvalue(address,flags,value) --Изменение адреса(хук оффсетов)
	local tt={}
	tt[1]={}
	tt[1].address=address
	tt[1].flags=flags
	tt[1].value=value
	gg.setValues(tt)
end
