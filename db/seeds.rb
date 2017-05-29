# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
SourceProvider.delete_all
User.delete_all

User.create!([
                 {last_name: 'Mylast1', first_name: 'Andrei', email: 'wQe123@email.com' },
                 {last_name: 'Mylast2', first_name: 'Vova', email: '1zxc@e2ail.COM' }
             ])

SourceProvider.create!([
                           {name: 'SourcePr1', url: 'http://yandex.ru/', address: 'Moscow, AnonymStreet 23', user_id: User.all.first.id},
                           {name: 'SourcePr2', url: 'http://google.com/', address: 'Minsk, AnonymStreet 25', user_id: User.all.first.id},
                           {name: 'SourcePr3', url: 'http://bing.com/', address: 'Kiev, AnonymStreet 29', user_id: User.all.first.id}
                       ])

CourseResult.create!([
    {usd:2.2, eur:5.5, rur:6.6, source_provider_id: SourceProvider.all.last.id},
    {usd:2.1, eur:5.2, rur:0.2, source_provider_id: SourceProvider.all.last.id}
                     ])
#   Character.create(name: 'Luke', movie: movies.first)
