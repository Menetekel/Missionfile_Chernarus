IF (player != player) exitWith {};

// Init global variables locally to avoid undefined values being used; then wait 5 sec for server
VFserverhours = 0;
VFservermin = 0;
_localhours = 0;
_localmin = 0;
sleep 5;

WHILE {TRUE} DO
{
	sleep 1;
	_localhours = floor daytime;
	IF (_localhours == 0) THEN {_localmin = (60 * daytime)};
	IF (_localhours > 0) THEN {_localmin = 60 * (daytime MOD (floor daytime))};
	skipTime (VFserverhours - _localhours);
	skipTime ((VFservermin - _localmin) / 60);
};