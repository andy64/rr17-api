# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
SourceProvider.delete_all
User.delete_all
CourseResult.delete_all
SourceParser.delete_all
SourceParser.create!([
    {parser_name: 'NbParser', url: 'https://www.nbrb.by'},
    {parser_name: 'BsbParser', url: 'https://bsb.by'},
    {parser_name: 'ParitetParser', url: 'http://www.paritetbank.by'}
                     ])
User.create!([
                 {last_name: 'Mylast1', first_name: 'Andrei', email: 'admin@email.com', password: 'admin'  },
                 {last_name: 'Mylast2', first_name: 'Andrei', email: 'admin2@email.com', password: 'admin2' },
             ])

SourceProvider.create!([
                           {name: 'SourcePr1', url: 'https://www.nbrb.by', address: 'Moscow, AnonymStreet 23', user_id: User.all.last.id},
                           {name: 'SourcePr2', url: 'https://bsb.by', address: 'Minsk, AnonymStreet 25', user_id: User.all.last.id},
                           {name: 'SourcePr3', url: 'http://www.paritetbank.by', address: 'Kiev, AnonymStreet 29', user_id: User.all.last.id}
                       ])

CourseResult.create!([
    {usd:2.2, eur:5.5, rur:6.6, source_provider_id: SourceProvider.all.last.id},
    {usd:2.1, eur:5.2, rur:0.2, source_provider_id: SourceProvider.all.last.id}
                     ])
#   Character.create(name: 'Luke', movie: movies.first)
