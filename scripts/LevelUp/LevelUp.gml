function LevelUp(){
	
	if(global.xp>=25&&global.playerLevel<2){
		global.playerLevel=2;
		global.maxhp+=10;
		global.hp=global.maxhp;
	}
	else if(global.xp>=75&&global.playerLevel<3){
		global.playerLevel=3;
			global.maxhp+=10;
		global.hp=global.maxhp;
	}
	else if(global.xp>=150&&global.playerLevel<4){
		global.playerLevel=4;
			global.maxhp+=10;
		global.hp=global.maxhp;
	}
	else if(global.xp>=250&&global.playerLevel<5){
		global.playerLevel=5;
			global.maxhp+=10;
		global.hp=global.maxhp;
	}

}