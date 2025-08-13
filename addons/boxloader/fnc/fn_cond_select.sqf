params ["_this","_target","_cur"]; (
((vehicle _this == _target) || (vehicle _this getVariable ["boxloader_canload",false])) &&
isNull (_this getVariable ["boxloader_tgt",objNull]) &&
{((_cur modelToWorld (_cur getVariable ["boxloader_load_pos",[0,0,0]])) distance _this)<15} && {
vehicleCargoEnabled _cur &&
alive _cur &&
isClass (configFile >> "CfgVehicles" >> (typeOf _cur) >> "vehicleTransport" >> "Carrier") && 
!(_cur getVariable ["boxloader_dontload",false])
})
