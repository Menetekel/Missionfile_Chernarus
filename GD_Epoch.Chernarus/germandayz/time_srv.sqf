// Map objects needed: game logic called "Server"
// servertime = continuous count of time in seconds on the server
// _accel = acceleration factor (24h in 1h = accel 24)
// VFserverhours, VFservermin are public (global) variables that contain the server time

IF (!isServer) exitWith {};

Private ["_accel","_onehour","_oneday","_servertime"];

_accel = _this select 0;
_onehour = 3600;
_oneday = (24 * _onehour) - _accel;
_servertime = (daytime * _onehour);

WHILE {TRUE} DO
{
	sleep 1;
	_servertime = _servertime + _accel;
	VFserverhours = floor(_servertime / 3600);
	VFservermin = floor((_servertime MOD 3600) / 60);
	publicVariable "VFserverhours";
	publicVariable "VFservermin";
};