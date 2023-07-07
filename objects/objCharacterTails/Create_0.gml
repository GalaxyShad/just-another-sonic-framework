
SFX_COLOR_MAGIC			=	#D80024;
SFX_COLOR_MAGIC_SUPER	=	#FFCE57;

PAL_CLASSIC = [ #2424b4, #2448d8, #4848fc, #6c6cfc ];
PAL_SUPER   = [ 
	[ #ce9034, #ffac34, #ffce57, #ffff74 ],
	[ #ffac74, #ffce90, #ffffac, #ffffce ], 
	[ #ffffaa, #ffffaa, #ffffaa, #ffffaa ],
	[ #ffac74, #ffce90, #ffffac, #ffffce ], 
];

SENSOR_FLOORBOX_NORMAL	=	[8, 20];
SENSOR_FLOORBOX_ROLL	=	[7, 15];
SENSOR_FLOORBOX_SPECIAL	=	[10,10]; //Glide and Climbe

SENSOR_WALLBOX_NORMAL	=	[10, 8];
SENSOR_WALLBOX_SLOPES	=	[10, 0];

sensor = new Sensor(x, y, SENSOR_FLOORBOX_NORMAL, SENSOR_WALLBOX_NORMAL);
state  = new State(self);
add_basic_player_states(state);

//state.override("jump",		new TailsStateJump());

physics = new PlayerPhysics();

animator = new PlayerAnimator();
animator
	.add("idle",		sprTails		)
	.add("bored",		sprTailsBored	).stop_on_end().speed(.25)
	.add("bored_ex",	sprTailsBoredEx	).speed(.25)
	
	.add("look_up",		sprTailsLookUp	).stop_on_end().speed(.25)
	.add("look_down",	sprTailsCrouch	).stop_on_end().speed(.25)
	
	.add("walking",		sprTailsWalk	)
	.add("running",		sprTailsRun		)
	.add("dash",		sprTailsDash	)
	
	.add("curling",		sprTailsRoll	)
	
	.add("spring",		sprTailsSpring	)
	.add("spindash",	sprTailsSpindash)
	.add("push",		sprTailsPush	).speed(.125)
	
	.add("skid",		sprTailsSkid	).stop_on_end().speed(.5)
	
	.add("balancing_a",	sprTailsBalancing).speed(.05)
	
	.add("hurt",		sprTailsHurt	).stop_on_end()
	.add("breathe",		sprTailsSkid	).stop_on_end().speed(.5)	
	
	.add("die",			sprTailsDie		).speed(0)
		
	//.add("transform",   sprTailsTransform	).stop_on_end().speed(.5)/
;
animator.set("idle");


// Inherit the parent event
event_inherited();

