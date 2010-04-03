# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tianguis_session',
  :secret      => '53a9cd09629b9c7bc97154c1b6e4e4693e9a39b5ce9311da5b25b79aee66ee5f22cd0cd358ae797124b446d9b4642a0796aa14e8467618cdc841bfd4727eb456'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
