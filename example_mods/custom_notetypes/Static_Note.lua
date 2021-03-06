function onCreate()

	precacheImage('hitStatic')
	--Iterate over all notes
	for i = 9, getProperty('unspawnNotes.length')-9 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'staticNotes' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'staticNotes'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'staticNotes' then
		if getProperty('dad.curCharacter') == 'tooslowsonic' then
			characterPlayAnim('dad', 'hey', true);
		end
		if getProperty('dad.curCharacter') == 'ycrsonic' then
			characterPlayAnim('dad', 'hey', true);
		end
		if getProperty('dad.curCharacter') == 'eggman' then
			characterPlayAnim('dad', 'hey', true);
		end
		
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Static_Note' then
		playSound('hitStatic1', 1.0);
		makeAnimatedLuaSprite('redstatic','hitStatic', 8, 8);
		addAnimationByPrefix('redstatic','blugh', 'staticANIMATION', 32, false);
		setObjectCamera('redstatic', 'camother');
		addLuaSprite('redstatic');
    end
end