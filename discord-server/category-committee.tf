## Category

// Category for Troop Committee
resource discord_category_channel committee_category {
  name = "Committee"
  server_id = data.discord_server.server.id
  position = 4
}

## Channels

// Private text channel for committee members
resource discord_text_channel committee_chat {
  name = "committee-chat"
  server_id = data.discord_server.server.id
  position = 0
  category = discord_category_channel.committee_category.id
}

// Voice channel for committee meetings
resource discord_voice_channel committee_meeting {
  name = "committee-meeting"
  server_id = data.discord_server.server.id
  position = 1
  category = discord_category_channel.committee_category.id
}

## Channel Permissions

// The committee category is private
resource discord_channel_permission committee_categoryrole_everyone {
  type = "role"
  channel_id = discord_category_channel.committee_category.id
  overwrite_id = discord_role_everyone.everyone.id
  deny = data.discord_permission.hidden.deny_bits
}

// The committee role can communicate in the committee category
resource discord_channel_permission committee_categoryrole_committee {
  type = "role"
  channel_id = discord_category_channel.committee_category.id
  overwrite_id = discord_role.committee.id
  allow = data.discord_permission.member.allow_bits
}