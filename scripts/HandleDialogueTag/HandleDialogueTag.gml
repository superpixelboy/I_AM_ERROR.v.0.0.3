/// @function HandleDialogueTag(tag, source_instance)
/// @param {string} tag - The tag to process
/// @param {id} source_instance - The instance that triggered this tag (usually o_text)
function HandleDialogueTag(tag, source_instance) {
    switch (tag) {
        case "give_coffee":
            GiveItem("Coffee (And Tray)", s_item_coffee, undefined);
            break;
            
        // Add more cases as you develop your game
        case "start_cutscene":
            // Create cutscene controller or set flags
            break;
            
        case "change_npc_state":
            // Find specific NPC and change its state
            break;
            
        default:
            // For debugging, you might want to show a message for unknown tags
            show_debug_message("Unknown dialogue tag: " + string(tag));
            break;
    }
}