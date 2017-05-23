# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
SourceProvider.delete_all
SourceProvider.create!([
                           {name: 'SourcePr1', url: 'http://yandex.ru/', address: 'Moscow, AnonymStreet 23'},
                           {name: 'SourcePr2', url: 'http://google.com/', address: 'Minsk, AnonymStreet 25'},
                           {name: 'SourcePr3', url: 'http://bing.com/', address: 'Kiev, AnonymStreet 29'}
                       ])
#   Character.create(name: 'Luke', movie: movies.first)
