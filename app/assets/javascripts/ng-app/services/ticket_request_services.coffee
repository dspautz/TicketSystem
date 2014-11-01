angular.module('TicketSystem').factory('TicketRequestSearch', ['railsResourceFactory', (railsResourceFactory) ->
    return railsResourceFactory
        url: '/api/ticket_requests/search',
        name: 'ticketRequestSearch' 
])

angular.module('TicketSystem').factory('TicketRequest', ['railsResourceFactory', 'railsSerializer', 'Ticket', (railsResourceFactory, railsSerializer, Ticket) ->
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