angular.module('TicketSystem').factory('User', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/users',
        name: 'user' 
])
