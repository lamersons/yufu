# class CreateVirtualUsers < ActiveRecord::Migration
#   def change
#     if ENV['RAILS_ENV'] != 'production'
#       create_table :virtual_users do |t|
#         t.string :email
#         t.string :password
#         t.references :domain, index: true
#
#       end
#     end
#   end
# end
