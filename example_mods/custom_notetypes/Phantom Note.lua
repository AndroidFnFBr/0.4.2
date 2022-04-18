local healthDrop = 0;
local FUCKYOU = 0;
function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Phantom Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PhantomNote');
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

function onUpdate()
    setProperty('health', getProperty('health') - healthDrop); 
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Phantom Note' then
		healthDrop = healthDrop + 0.00025;
		if healthDrop == 0.00025 then
			runTimer('BITCHLMAO', 0.1 , 100);
		else 
			FUCKYOU = 0;
		end
    end
end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'BITCHLMAO' then
		FUCKYOU = FUCKYOU + 1;
		if FUCKYOU >= 100 then
			healthDrop = 0;
		end
	end
end