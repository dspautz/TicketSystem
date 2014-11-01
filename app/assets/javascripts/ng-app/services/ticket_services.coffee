angular.module('TicketSystem').factory('Ticket', ['railsResourceFactory', 'railsSerializer', 'User', (railsResourceFactory, railsSerializer, User) ->
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

angular.module('TicketSystem').factory('TicketSearch', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/tickets/search',
        name: 'ticketSearch' 
])