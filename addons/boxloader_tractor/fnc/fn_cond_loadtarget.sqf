params ["_this","_target","_cur"]; (
(vehicle _this == _target) &&
!isNull _cur &&
((count getVehicleCargo _target)>0) &&
(_cur != _target) &&
{((_cur modelToWorld (_cur getVariable ["boxloader_load_pos",[0,0,0]])) distance _this)<15}
)
