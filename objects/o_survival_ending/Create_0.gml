
if(global.kills>=50){
endtext[0] = "Okay it looks like you actually know what you're doing!";
endtext[1] ="You've killed " + string(global.kills) + " of my bots.";
endtext[2] = "We might actually have a chance to save the world!";
}
else if(global.kills>=25){
endtext[0] = "Wow! You've killed " + string(global.kills) + " of my bots.";
endtext[1] = "That's pretty good. But you need to do better in the future.";
}
else if(global.kills>=10){
endtext[0] = "I'm sorry you've died and only killed " + string(global.kills) + " of my practice bots.";
endtext[1] = "I hope your next clone has hand-eye coordination.";
}
else if(global.kills>0){
endtext[0] = "You only managed to kill " + string(global.kills) + " of my bots.";
endtext[1] = "I don't know what to do with you if you're not taking this seriously.";
}
else{
	endtext[0] = "You are the worst null ever! You couldn't kill one bot?";
	endtext[1] = "Get out there and actually try";
}

spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text = "";
