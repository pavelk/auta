# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_auta_new_session',
  :secret      => 'f9a616fd1a8f9e7a8c086c1017ec5ce550d845696b68ffe163da07390b1a17afd9665687331afc2a444e8badb416cc5cb89ee338aa1697291960679dbd0bb768'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
