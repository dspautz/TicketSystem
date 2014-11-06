angular.module('TicketSystem').factory('Ticket', ['railsResourceFactory', 'railsSerializer', 'User', 'TicketStatus', 'TicketSearch', (railsResourceFactory, railsSerializer, User, TicketStatus, TicketSearch) ->
  resource = railsResourceFactory
    url: '/api/tickets',
    name: 'ticket'
  
  resource.prototype.getUser = -> 
    console.log("ticket.getUser("+@userId+")")
    return User.get(@userId)
    
  resource.prototype.getStatus = -> 
    console.log("ticket.getStatus("+@ticketStatusId+")")
    return TicketStatus.get(@ticketStatusId)
    
  return resource      
])

angular.module('TicketSystem').factory('TicketSearch', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/tickets/search',
        name: 'ticketSearch' 
])

angular.module('TicketSystem').factory('TicketStatus', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/ticket_statuses',
        name: 'ticketStatus' 
])