// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377


function PlayerCollision() {

	if (ground) {
		xsp = gsp *  dcos(sensor.get_angle());
		ysp = gsp * -dsin(sensor.get_angle());
	}
	
	
	x += xsp;
	y += ysp;	
	
	
	sensor.set_position(x, y);
	
	x = clamp(x, 0, room_width);

	
	sensor.set_wall_box(
		( (sensor.get_angle() <= 15 || sensor.get_angle() >= 345 ) && ground) ? 
		SENSOR_WALLBOX_NORMAL : SENSOR_WALLBOX_SLOPES
	);
	
	var _cos_ang = dcos(sensor.get_angle());
	var _sin_ang = dsin(sensor.get_angle());
	
	while (sensor.is_collision_solid_right()) {
		x -= _cos_ang;
		y += _sin_ang;
		
		sensor.set_position(x, y);
	}

	while (sensor.is_collision_solid_left()) {
		x += _cos_ang;
		y -= _sin_ang;
		
		sensor.set_position(x, y);
	}
	
	if (!ground) {	
		sensor.set_angle(0);
		
		if (sensor.is_collision_solid_top() && ysp < 0) {
	
			sensor.set_angle(180);
			var ang = sensor.get_ground_angle();
		
			show_debug_message($"{ang}");
			
			if (ang == 0) {
				sensor.set_angle(180);
				
				var is_col_left  = sensor.is_collision_ground_left_edge();
				var is_col_right = sensor.is_collision_ground_right_edge();
			
				if (!is_col_left && is_col_right) {
					sensor.set_angle(270);
				} 
			
				if (is_col_left && !is_col_right) {
					sensor.set_angle(90);
				}
				
				if (sensor.check_expanded(0, 5, sensor.is_collision_solid_bottom)) {
					ang = sensor.get_ground_angle();
				} else {
					ang = 0;
				}
			}
			
			show_debug_message($"nnn {ang}");
		
			if ((ang >= 91 && ang <= 135) || (ang >= 226 && ang <= 270)) {
				sensor.set_angle(ang);
				ground = true;
				gsp = ysp * -sign(dsin(sensor.get_angle()));
			
				player_landing();
			} else {
				sensor.set_angle(0);	
				ysp = 0;
			}
		}
		
		// Landing
		
		if (!ground && sensor.is_collision_solid_bottom() && ysp > 0) {
			ground = true;
			
			var _ang = sensor.get_ground_angle();
		
			if (_ang == 0) {
				sensor.set_angle(0);
				
				var is_col_left  = sensor.is_collision_ground_left_edge();
				var is_col_right = sensor.is_collision_ground_right_edge();
			
				if (!is_col_left && is_col_right) {
					sensor.set_angle(90);
				} 
			
				if (is_col_left && !is_col_right) {
					sensor.set_angle(270);
				}
				
				_ang = sensor.check_expanded(0, -4, sensor.get_ground_angle);
			}
		
			sensor.set_angle(_ang);
		
			_ang = abs(sensor.get_angle());
			if (_ang >= 180) 
				_ang = 360 - _ang;
		
			if ( _ang >= 0 &&  _ang <= 23)
				gsp = xsp;
				
			else if ( _ang >= 24 &&  _ang <= 45) {
				if (abs(xsp) > abs(ysp)) 
					gsp = xsp;
				else 
					gsp = ysp / 2 * -sign(dsin(sensor.get_angle()));
			
			} else if ( _ang >= 46 &&  _ang <= 100) {
				if (abs(xsp) > abs(ysp))
					gsp = xsp;
				else 
					gsp = ysp * -sign(dsin(sensor.get_angle()));
			}
			
			player_landing();
			
			ysp = 0;
		}
	

	}
	
	if (ground) {
		_cos_ang = dcos(sensor.get_angle());
		_sin_ang = dsin(sensor.get_angle());
		
		
		while (sensor.is_collision_solid_bottom()) {
			y -= _cos_ang;	
			x -= _sin_ang;
			sensor.set_position(x, y);
		}
		
		while (!sensor.is_collision_solid_bottom() && 
				sensor.is_collision_ground()
		) {
			y += _cos_ang;	
			x += _sin_ang;
			sensor.set_position(x, y);
		}
		
		// Possible slopes thickering fix
		while (abs(gsp) < 6 && sensor.is_collision_solid_bottom()) {
			y -= _cos_ang / 100;	
			x -= _sin_ang / 100;
			sensor.set_position(x, y);
		}
		
		sensor.set_angle(sensor.get_ground_angle());
		
		if (!sensor.is_collision_ground()) {
			sensor.set_angle(0);
			ground = false;
		} 
	} 
	

}

