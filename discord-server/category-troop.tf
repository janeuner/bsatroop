## Category

resource discord_category_channel troop_category {
  name = "Troop"
  server_id = data.discord_server.server.id
  position = 1
}

## Channels

resource discord_text_channel general {
  name = "general"
  server_id = data.discord_server.server.id
  position = 0
  category = discord_category_channel.troop_category.id
}

resource discord_text_channel campouts {
  name = "campouts"
  server_id = data.discord_server.server.id
  position = 1
  category = discord_category_channel.troop_category.id
  topic = "Announcements and chat for campers during campouts."
}

resource discord_text_channel pictures {
  name = "pictures"
  server_id = data.discord_server.server.id
  position = 2
  category = discord_category_channel.troop_category.id
  topic = "Photos of scouts caught doing scout things."
}

resource discord_text_channel ask_a_leader {
  name = "ask-a-leader"
  server_id = data.discord_server.server.id
  position = 3
  category = discord_category_channel.troop_category.id
}

// Text channel for fundraiser planning & announcements
resource discord_text_channel committee_fundraisers {
  name = "fundraisers"
  server_id = data.discord_server.server.id
  position = 4
  category = discord_category_channel.troop_category.id
  topic = "Post your gift basket for the silent auction here!  Include a picture and quick description of the contents."
}

## Channel Permissions

// Everyone can communicate in the #general channel
resource discord_channel_permission troop_categoryrole_everyone {
  type = "role"
  channel_id = discord_category_channel.troop_category.id
  overwrite_id = discord_role_everyone.everyone.id
  allow = data.discord_permission.member.allow_bits
}

// The scout role can communicate in the troop category
resource discord_channel_permission troop_categoryrole_scout {
  type = "role"
  channel_id = discord_category_channel.troop_category.id
  overwrite_id = discord_role.scout.id
  allow = data.discord_permission.member.allow_bits
}

// The parent role can communicate in the troop category
resource discord_channel_permission troop_categoryrole_parent {
  type = "role"
  channel_id = discord_category_channel.troop_category.id
  overwrite_id = discord_role.parent.id
  allow = data.discord_permission.member.allow_bits
}

// The council role can moderate the troop category
resource discord_channel_permission troop_categoryrole_council {
  type = "role"
  channel_id = discord_category_channel.troop_category.id
  overwrite_id = discord_role.council.id
  allow = data.discord_permission.moderator.allow_bits
}

// The committee role can moderate the troop category
resource discord_channel_permission troop_categoryrole_committee {
  type = "role"
  channel_id = discord_category_channel.troop_category.id
  overwrite_id = discord_role.committee.id
  allow = data.discord_permission.moderator.allow_bits
}
