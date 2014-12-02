# class CreateVirtualAliases < ActiveRecord::Migration
#   def change
#     if ENV['RAILS_ENV'] != 'production'
#       create_table :virtual_aliases do |t|
#         t.string :source
#         t.string :destination
#         t.references :domain, index: true#
#       end
#      end
#   end
# end
