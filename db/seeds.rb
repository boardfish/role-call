# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create(
#              [{ name: 'Star Wars' }, { name: 'Lord of the Rings' }]
#              )
#   Character.create(name: 'Luke', movie: movies.first)

# Seed all roles
seed_file = Rails.root.join('db', 'seeds', 'roles.yml')
config = YAML.load_file(seed_file)
Role.create!(config)
win_condition_seed_file = Rails.root.join('db', 'seeds', 'win_conditions.yml')
win_condition_config = YAML.load_file(win_condition_seed_file)
WinCondition.create!(win_condition_config)
