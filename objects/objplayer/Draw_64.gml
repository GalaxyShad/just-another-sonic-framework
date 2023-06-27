/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

/*
x = mouse_x;
y = mouse_y;

if mouse_check_button(mb_left)
	sensor.angle--;
if mouse_check_button(mb_right)
	sensor.angle++;*/

if (!show_debug_info)
	exit;

draw_text(
	16, 240,
	$"fps:				f{fps}\n"+
	$"ground:			{ground}\n" +
	$"action:			{state.current()}\n"+
	$"gsp:				{gsp}\n" +
	$"xsp:				{xsp}\n" +
	$"ysp:				{ysp}\n" +
	$"sensor_angle:		{sensor.get_angle()}\n" +
	$"animation_angle:	{animation_angle}\n" +
	$"\n" +
	$"allow_jump:		{allow_jump}\n" +
	$"allow_movement:	{allow_movement}\n" +
	$"\n" +
	$"remaining_air:	{remaining_air}/{timer_underwater.get_count()}"

	/*
	"edge_left: " + string(sensor.is_collision_left_edge()) + "\n" + 
	"edge_right: " + string(sensor.is_collision_right_edge()) + "\n"	
	
	"found-angle: " + string(sensor.get_ground_angle()) + "\n" +

	"collision-left: " + string(sensor.is_collision_left()) + "\n" +
	"collision-right: " + string(sensor.is_collision_right()) + "\n" +
	"collision-top: " + string(sensor.is_collision_top()) + "\n" +
	"collision-bottom: " + string(sensor.is_collision_bottom()) + "\n" +
	"collision-ground: " + string(sensor.is_collision_ground()) + "\n"
	*/
);





