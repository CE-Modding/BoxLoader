params ["_this","_target","_cur"];(
boxloader_maxload_enabled &&
{(vehicle _this == _target) || (vehicle _this getVariable ["boxloader_canload",false])} &&
{!isNull (_this getVariable ["boxloader_tgt",objNull])} &&
alive _cur &&
{(_cur getVariable ["boxloader_load_weight",0]>0) && ((_cur distance _this)<15)}
)
