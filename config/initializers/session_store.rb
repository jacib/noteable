# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_noteable_session',
  :secret      => 'ac693ee120cb943ed9f59cf9868a42d8ac7a1e224ac68109e6b978b48b43ade8598ebdc0b046546737775cd5395d6abea4b523c459744b5f54e28847172fdec1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
