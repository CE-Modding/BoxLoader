params ["_this","_target","_cur"];
_tgt = (_this getVariable ["boxloader_tgt",objNull]); (
(vehicle _this == _target || vehicle _this getVariable ["boxloader_canload",false]) &&
{!isNull (_this getVariable ["boxloader_tgt",objNull])} &&
{(_cur distance _this)<5} &&
{(_tgt canVehicleCargo _cur) select 0} &&
alive _tgt &&
{((_tgt modelToWorld (_tgt getVariable ["boxloader_load_pos",[0,0,0]])) distance _this)<15 &&
!(_cur isKindOf "Boxloader_Pallet_Base") && (!boxloader_maxload_enabled || {[_this,_cur] call boxloader_fnc_getmaxlift})}
)
