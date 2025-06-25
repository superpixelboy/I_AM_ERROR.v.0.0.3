hsp = 0;
vsp = 0;
isCombo = 0;
grv = 0.3
walksp = 4;
isAttacking = 0;
isDucking = 0;
isBlocking = 0;
hascontrol = true;
//key_attack =0;
firingdelay = 0;
canjump = 0;
jumpStart =0;
skiponeway=0;
powerUpBlast = global.up_powerup;
blastCombo =0;
powerUpFireball=0;
//powerUpAirBlast =0;
//powerUpSweep =0;
powerUpFireball=global.finisher_powerup;
fireballLevel=0;
powerUpFastFall=0;
powerUpUppercut =global.forward_powerup;
isInvincible = 0;
hitFromR= 0;
hasjumpattacked = 0;
enemieshit =0;
jumpnum =0;
stamrefill = true;
//Fast Fall
isFastFall=0;
ffBounceTime = 0.5;
ffTimer = ffBounceTime;
healTimer=0;
healthMod=0;
healthFadeOut=1;

last_key_press_time = 0;
last_key_direction = 0;  // 1 for right, -1 for left
dash_threshold = 0.25;   // Time window in seconds for double tap (adjust as needed)
key_released = true;  // Add this new variable
dashCost = 30;
dashCooldown= 30;
canDash=0;
blockCooldown=0;
state = PLAYERSTATE.SPAWN;
hitByAttack = ds_list_create();

dialogue_buffer = 0;
canExitGotItem = 0;
levelLoadY=213;
ground_check_timer = 5;
spawn_timer = 10; // Wait ~10 frames before control is handed over


//create controlthings:
key_left = 0;
key_right = 0;
key_duck = 0;
key_jump = 0;
key_attack = 0;
key_up = 0;
key_spattack = 0;
key_block = 0;
key_ult = 0;
key_assist = 0;

enum PLAYERSTATE
{
	FREE,
	ASSIST,
	ATTACK_POKE,
	ATTACK_COMBO,
	ATTACK_KNOCKBACK,
	SP_BLAST,
	SP_BLAST2,
	SP_BLASTAIR1,
	SP_BLASTAIR2,
	SP_SWEEP,
	SP_UPPERCUT,
	SP_FIREBALL,
	SMALL_HIT,
	BLOCK,
	DUCK_POKE,
	FAST_FALL,
	HARD_LANDING,
	JUMP_ATTACK1,
	JUMP_ATTACK2,
	JUMP_ATTACK3,
	JUMP,
	DASH,
	DUCK,
	DIVEKICK,
	DIALOGUE,
	RECEIVE_ITEM,
	SPAWN
}

//Transitions and Doors==================
if(global.entry_label=="bookstore to hallway")
{
	x=445;
	y=levelLoadY;
	image_xscale=-1;
}

if(global.entry_label=="hallway from gparoom")
{
	x=92;
	y=levelLoadY;
}

if(global.entry_label=="hallway from attic")
{
	x=256;
	y=levelLoadY;
}

if(global.entry_label=="bookstore from hallway")
{
	x=1157;
	y=levelLoadY;
}

if(global.entry_label=="basement to bookstore")
{
	x=65;
	y=levelLoadY;
}

//Ensure we can't move before we finish intro diologe in the bookstore
if(room==IntroBookstore){
	hascontrol=false;
}
