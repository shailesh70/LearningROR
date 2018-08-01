# Be sure to restart your server when you modify this file.

BlaBlaCar::Application.config.session_store :cookie_store, key: '_BlaBlaCar_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# BlaBlaCar::Application.config.session_store :active_record_store
# BlaBlaCar::Application.config.session_store :redis_store, servers: ["redis://localhost:6379/0/session"]
# MyApplication::Application.config.cache_store = :redis_store, {
#   host: "localhost",
#   port: 6379,
#   db: 0,
#   password: "mysecret",
#   namespace: "cache"
# }