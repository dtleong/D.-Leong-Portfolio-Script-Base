# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_untitled_session',
  :secret      => 'ca91babc2d94501322e3902b96c5ce1645083684d2dba22a05cb99038a9d4c03b3b85e4edec3dd448e164de2845b9ea5a9a17d3aef0a3bc37c8290e72cd68d4c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
