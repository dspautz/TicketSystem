angular.module('OnApp').factory('Login', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/sign_in',
        name: 'login' 
])

angular.module('OnApp').factory('Logout', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/sign_out',
        name: 'logout' 
])

angular.module('OnApp').factory('Ticket', ['railsResourceFactory', 'railsSerializer', 'User', (railsResourceFactory, railsSerializer, User) ->
  resource = railsResourceFactory
    url: '/api/tickets',
    name: 'ticket',
    serializer: railsSerializer -> 
      @resource 'user', 'User'
  
  resource::user = -> User.get @userId         
    
  return resource      
])

angular.module('OnApp').factory('TicketSearch', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/tickets/search',
        name: 'ticketSearch' 
])

angular.module('OnApp').factory('RequestSearch', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/requests/search',
        name: 'requestSearch' 
])

angular.module('OnApp').factory('Request', ['railsResourceFactory', 'railsSerializer', 'Ticket', (railsResourceFactory, railsSerializer, Ticket) ->
  resource = railsResourceFactory
    url: '/api/requests',
    name: 'request',
    serializer: railsSerializer -> 
      @resource 'ticket', 'Ticket'
  
  resource::ticket = -> Ticket.get @ticketId         
    
  return resource      
])

angular.module('OnApp').factory('User', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/users',
        name: 'user' 
])

angular.module('OnApp').factory('UserSearch', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/users/search',
        name: 'userSearch' 
])


angular.module('OnApp').factory('StatusList', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/status_list',
        name: 'statusList' 
])
