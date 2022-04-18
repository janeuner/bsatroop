data discord_server server {
  server_id = var.discord_server_id
}

resource discord_server server {
  name = var.discord_server_name
  region = var.discord_server_region
  owner_id = var.discord_server_owner
  system_channel_id = discord_text_channel.admin_logs.id
  verification_level = 1
  explicit_content_filter = 2
  default_message_notifications = 1
}