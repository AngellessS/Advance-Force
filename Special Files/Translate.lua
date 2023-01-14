function Translate(text, selected_language, target_language)
	for i = 1,#EnglishTable do
		if text == RussianTable[i] and target_language == "English(Transated)" then
			text = EnglishTable[i]
		elseif text == EnglishTable[i] and target_language == "Русский(Translated)" then
			text = RussianTable[i]
		end
	end
	return text
end

