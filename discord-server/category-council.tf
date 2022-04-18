## Category

// Category for Patrol Leader Council
resource discord_category_channel council_category {
  name = "Patrol Leader Council"
  server_id = data.discord_server.server.id
  position = 2
}

## Channels

// Private text channel for council members
resource discord_text_channel council_chat {
  name = "council-chat"
  server_id = data.discord_server.server.id
  position = 0
  category = discord_category_channel.council_category.id
}

// Voice channel for council meetings
resource discord_voice_channel council_meeting {
  name = "council-meeting"
  server_id = data.discord_server.server.id
  position = 1
  category = discord_category_channel.council_category.id
}

## Channel Permissions

// The council category is private
resource discord_channel_permission council_categoryrole_everyone {
  type = "role"
  channel_id = discord_category_channel.council_category.id
  overwrite_id = discord_role_everyone.everyone.id
  deny = data.discord_permission.hidden.deny_bits
}

// The council role can communicate in the council category
resource discord_channel_permission council_categoryrole_committee {
  type = "role"
  channel_id = discord_category_channel.council_category.id
  overwrite_id = discord_role.council.id
  allow = data.discord_permission.member.allow_bits
}