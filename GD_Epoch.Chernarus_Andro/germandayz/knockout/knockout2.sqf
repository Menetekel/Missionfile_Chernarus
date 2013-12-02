private["_body","_duration","_r"];
_body = _this select 0;
_duration = _this select 1;

diag_log("Knockout attempt on:" + str(_body) + " and I am: " + str(player) );

if (_body == player) then {
	diag_log("Knocked out!");
	//playSound "beat01";
	[player, _duration] call fnc_usec_damageUnconscious;
	sleep 0.75;
	_r=floor(random 3);    //0-2

if (_r == 0) then {
		playSound "beat02";
		//player say "beat01";
};
if (_r == 1) then {
		playSound "beat03";
		//player say "beat03";
};
if (_r == 2) then {
		playSound "beat04";
		//player say "beat04";
};	
	cutText ["You've been knocked out!", "PLAIN DOWN"];
};