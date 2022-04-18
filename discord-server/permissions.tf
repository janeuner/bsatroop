data discord_permission admin {
    administrator           = "allow"
}

data discord_permission visible {
    view_channel            = "allow"
}

data discord_permission hidden {
    view_channel            = "deny"
}

data discord_permission readonly {
    manage_messages         = "deny"
}

data discord_permission invite {
    add_reactions           = "allow"
    create_instant_invite   = "allow"
    view_channel            = "allow"
    read_message_history    = "allow"
    use_vad                 = "allow"
}

data discord_permission moderator {
    create_instant_invite   = "deny"
    kick_members            = "allow"
    ban_members             = "allow"
    administrator           = "deny"
    manage_channels         = "deny"
    manage_guild            = "deny"
    add_reactions           = "allow"
    view_audit_log          = "allow"
    priority_speaker        = "allow"
    stream                  = "allow"
    view_channel            = "allow"
    send_messages           = "allow"
    send_tts_messages       = "deny"
    manage_messages         = "deny"
    embed_links             = "allow"
    attach_files            = "allow"
    read_message_history    = "allow"
    mention_everyone        = "allow"
    use_external_emojis     = "deny"
    view_guild_insights     = "allow"
    connect                 = "allow"
    speak                   = "allow"
    mute_members            = "allow"
    deafen_members          = "deny"
    move_members            = "allow"
    use_vad                 = "allow"
    change_nickname         = "allow"
    manage_nicknames        = "allow"
    manage_roles            = "deny"
    manage_webhooks         = "deny"
    manage_emojis           = "deny"
}

data discord_permission member {
    view_channel            = "allow"

    send_messages           = "allow"
    embed_links             = "allow"
    attach_files            = "allow"
    mention_everyone        = "allow"

    stream                  = "allow"
    connect                 = "allow"
    speak                   = "allow"
}

data discord_permission chatonly {
    view_channel            = "allow"

    send_messages           = "allow"
    embed_links             = "allow"
    attach_files            = "allow"
    mention_everyone        = "allow"
}

data discord_permission talkonly {
    view_channel            = "allow"

    stream                  = "allow"
    connect                 = "allow"
    speak                   = "allow"
}

data discord_permission observer {
    create_instant_invite   = "deny"
    kick_members            = "deny"
    ban_members             = "deny"
    administrator           = "deny"
    manage_channels         = "deny"
    manage_guild            = "deny"
    add_reactions           = "allow"
    view_audit_log          = "deny"
    priority_speaker        = "deny"
    stream                  = "deny"
    view_channel            = "allow"
    send_messages           = "deny"
    send_tts_messages       = "deny"
    manage_messages         = "deny"
    embed_links             = "deny"
    attach_files            = "deny"
    read_message_history    = "allow"
    mention_everyone        = "deny"
    use_external_emojis     = "deny"
    view_guild_insights     = "deny"
    connect                 = "deny"
    speak                   = "deny"
    mute_members            = "deny"
    deafen_members          = "deny"
    move_members            = "deny"
    use_vad                 = "allow"
    change_nickname         = "deny"
    manage_nicknames        = "deny"
    manage_roles            = "deny"
    manage_webhooks         = "deny"
    manage_emojis           = "deny"
}