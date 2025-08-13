_par = params [["_veh",objNull,[objNull]]];
if ((!_par) || (isNull _veh) || !(_veh isKindOf "boxloader_palletjack_veh_base")) exitWith {false};
if (_veh getVariable ["boxloader_tractor_init",false]) exitWith {false};
_veh setVariable ["boxloader_tractor_init",true];
if (is3DEN) exitWith {true};
_veh setVariable ['boxloader_load_viv',true];
_veh setVariable ['boxloader_load_weight',5000];
_veh setVariable ['boxloader_load_height',0.5];
_veh setVariable ['boxloader_canload',true];
_veh setCenterOfMass [0,0.5,-0.5];
_veh addAction ["Load cargo into self",{
	_veh = vehicle (_this select 1);
	_box = cursorObject;
	if (((_veh canVehicleCargo _box) select 0) && (_box distance _veh)<15 && (!boxloader_maxload_enabled || [_veh,_box] call boxloader_fnc_getmaxlift)) then {
		[_veh,_box] call boxloader_fnc_load;
	};
},[],0,false,true,"","(vehicle _this == _target) && {((_target canVehicleCargo cursorObject) select 0)} && {(cursorObject distance _target)<15 && (!boxloader_maxload_enabled || [_target,cursorObject] call boxloader_fnc_getmaxlift)}"];


_veh addAction ["Load cargo into target",{
	_veh = vehicle (_this select 1);
	_tgt = (_this select 1 getVariable ["boxloader_tgt",objNull]);
	{
		_box = _x;
		if (((_tgt canVehicleCargo _box) select 0) && ((_box distance _tgt)<15) && (!boxloader_maxload_enabled || [(_this select 1),_box] call boxloader_fnc_getmaxlift)) then {
			[_tgt,_box] call boxloader_fnc_load
		}
	} forEach getVehicleCargo (_this select 0);
	[_this select 0] spawn {
		sleep 0.1;
		if ((count getVehicleCargo (_this select 0)) > 0) then {
			hint "Could not load all cargo.";
		}
	}
},[],5,false,true,"","(vehicle _this == _target) && !(isNull (_this getVariable ['boxloader_tgt',objNull])) && ((count getVehicleCargo _target)>0) && (_this getVariable ['boxloader_tgt',objNull] != _target) && (_this getVariable ['boxloader_tgt',objNull] distance _this)<15"];

true
