angular.module('TicketSystem').factory('Login', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/sign_in',
        name: 'login' 
])

angular.module('TicketSystem').factory('Logout', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/sign_out',
        name: 'logout' 
])