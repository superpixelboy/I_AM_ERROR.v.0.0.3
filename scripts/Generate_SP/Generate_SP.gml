function Generate_SP(){
	if(global.sp<300){
		global.sp+=20;
	}
	else{
		global.sp = 300;
	}
}