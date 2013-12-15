    while{alive player} do {
            waitUntil{inSafeZone};
sleep 0.5;
if((isPlayer cursorTarget) && (alive cursorTarget) && (side cursorTarget == side player) && (player distance cursorTarget < 10)) then {
_tag = name cursorTarget;
cutText [_tag,"PLAIN",0.1];
};
         waitUntil{!inSafeZone};
};

	if (isNil "inSafezone") then {inSafezone = false;};
	while {true} do {
		waitUntil {sleep 1;(inSafeZone)};
			sleep 0.5;
			if((isPlayer cursorTarget) && (alive cursorTarget) && (side cursorTarget == side player) && (player distance cursorTarget < 10)) then {
				_tag = name cursorTarget;
				cutText [_tag,"PLAIN",0.1];
			};