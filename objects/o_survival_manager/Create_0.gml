/// @description Survial Variables
// You can write your code in this editor

// Wave Variables
waveNum = 1;            // Current wave number
spawnInterval = 120;    // Time between spawns (in steps)
spawnCountdown = spawnInterval; // Countdown to the next spawn
downTime = true;        // Whether it's downtime between waves
spawnLocation = 0;      // Index of the spawn location
enemiesLeft = 0;        // Enemies remaining in the current wave

// Enemy Spawn Data
enemyTypes = [o_mouse];  // Initial list of enemies
spawnPoints = [];       // Array for spawn locations (to populate later)

// Wave Scaling
enemiesPerWave = 3;     // Base number of enemies per wave
enemyGrowthRate = 3;    // Additional enemies per wave
// Track kills for the current wave
killCount = 0;
// Total number of enemies for the current wave
totalEnemiesForWave = 0; // Updated during initialize_wave


function update_enemy_types() {
	 if (waveNum > 1 && !array_contains(enemyTypes, o_bat)) {
        array_push(enemyTypes, o_bat); // Add gun frog after wave 1
    }
    if (waveNum > 3 && !array_contains(enemyTypes, o_frog_gun)) {
        array_push(enemyTypes, o_frog_gun); // Add gun frog after wave 5
    }
  
}

function initialize_wave() {
    if (!downTime) return;

    show_debug_message("Initializing Wave: " + string(waveNum));

    // Calculate total enemies for the wave
    totalEnemiesForWave = enemiesPerWave + (waveNum - 1) * enemyGrowthRate;
    enemiesLeft = totalEnemiesForWave; // Enemies still to spawn
    killCount = 0; // Reset the kill count

    update_enemy_types(); // Add new enemy types as needed

    spawnCountdown = spawnInterval; 
    downTime = false;
}


// Example spawn points
spawnPoints = [
    {x: 200, y: 300}, 
    {x: 300, y: 300}, 
    {x: 400, y: 300},
	{x: 500, y: 300}, 
    {x: 600, y: 300}, 
    {x: 700, y: 300}
];

