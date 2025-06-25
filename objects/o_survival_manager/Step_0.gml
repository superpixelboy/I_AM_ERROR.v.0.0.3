// Handle downtime (wave transition)
if (downTime) {
    initialize_wave(); // Start the next wave during downtime
    return; // Skip the rest of the logic during downtime
}

// Count down to the next spawn
spawnCountdown -= 1;

// Spawn enemies if needed
if (spawnCountdown <= 0 && enemiesLeft > 0) {
    // Randomly pick an enemy type
    if (array_length(enemyTypes) > 0) {
        var enemyType = enemyTypes[irandom(array_length(enemyTypes) - 1)];

        // Randomly pick a spawn point
        spawnLocation = irandom(array_length(spawnPoints) - 1);
        var spawnX = spawnPoints[spawnLocation].x;
        var spawnY = spawnPoints[spawnLocation].y;

        // Spawn the enemy
        instance_create_layer(spawnX, spawnY, "Badguys", enemyType);

        // Update counters
        enemiesLeft -= 1; // Decrease enemies left to spawn
        spawnCountdown = spawnInterval; // Reset the spawn countdown
    }
}

// Check if the wave is complete
if (killCount >= totalEnemiesForWave) {
    // All enemies for this wave have been killed
    downTime = true;    // Enter downtime
    waveNum += 1;       // Progress to the next wave
	global.wave = waveNum;
}
