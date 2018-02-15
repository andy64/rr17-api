# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_171_228_112_450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'course_results', force: :cascade do |t|
    t.decimal 'usd', precision: 8, scale: 4
    t.decimal 'eur', precision: 8, scale: 4
    t.decimal 'rur', precision: 8, scale: 4
    t.datetime 'created_at'
    t.integer 'source_provider_id'
  end

  create_table 'delayed_jobs', force: :cascade do |t|
    t.integer 'priority', default: 0, null: false
    t.integer 'attempts', default: 0, null: false
    t.text 'handler', null: false
    t.text 'last_error'
    t.datetime 'run_at'
    t.datetime 'locked_at'
    t.datetime 'failed_at'
    t.string 'locked_by'
    t.string 'queue'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[priority run_at], name: 'delayed_jobs_priority'
  end

  create_table 'source_parsers', force: :cascade do |t|
    t.string 'parser_name'
    t.string 'url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'source_providers', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'url', null: false
    t.string 'address', null: false
    t.datetime 'last_sync_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'active', default: true
    t.integer 'user_id', null: false
    t.index ['name'], name: 'index_source_providers_on_name'
    t.index ['url'], name: 'index_source_providers_on_url'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
