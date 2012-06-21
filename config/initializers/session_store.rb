# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_labelmaker_session',
  :secret      => 'd29c8c668796b4be39f1b2cccdb570d717a6f2aad17c37e5f327f3b081211372ee417247cdc9867fa7f1465426b596269c485a41de0da1b4ea5df2c1f11a5fc3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
