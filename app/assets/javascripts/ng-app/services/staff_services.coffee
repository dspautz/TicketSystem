angular.module('TicketSystem').factory('User', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/users',
        name: 'user' 
])

angular.module('TicketSystem').factory('Role', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/roles',
        name: 'role' 
])
