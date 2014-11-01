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
  
  resource.prototype.getUser = -> 
    console.log("ticket.getUser("+@userId+")")
    return User.get(@userId)
    
  return resource      
])

angular.module('OnApp').factory('TicketSearch', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/tickets/search',
        name: 'ticketSearch' 
])

angular.module('OnApp').factory('TicketRequestSearch', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/ticket_requests/search',
        name: 'requestSearch' 
])

angular.module('OnApp').factory('TicketRequest', ['railsResourceFactory', 'railsSerializer', 'Ticket', (railsResourceFactory, railsSerializer, Ticket) ->
  resource = railsResourceFactory
    url: '/api/ticket_requests',
    name: 'ticketRequest',
    serializer: railsSerializer -> 
      @resource 'ticket', 'Ticket'
  
  resource.prototype.getTicket = -> 
    console.log("ticketRequest.getTicket("+@ticketId+")")
    return Ticket.get(@ticketId)      
    
  return resource      
])

angular.module('OnApp').factory('User', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/users',
        name: 'user' 
])

#angular.module('OnApp').factory('UserSearch', ['railsResourceFactory', (railsResourceFactory) ->
#    return railsResourceFactory
#        url: '/api/users/search',
#        name: 'userSearch' 
#])


#angular.module('OnApp').factory('StatusList', ['railsResourceFactory', (railsResourceFactory) ->
#    return railsResourceFactory
#        url: '/api/status_list',
#        name: 'statusList' 
#])
