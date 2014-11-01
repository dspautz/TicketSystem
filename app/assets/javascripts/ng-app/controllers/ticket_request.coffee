angular.module('OnApp').controller("TicketRequestCtrl", [ '$scope', '$location', '$window', 'Ticket', 'User', 'TicketRequest','TicketRequestSearch', ($scope, $location, $window, Ticket, User, TicketRequest, TicketRequestSearch)->
    
  $scope.newTicketRequest=null
  $scope.currentTicketRequest=null
  $scope.message=""
  
  if $window.currentTicket
    console.log("############################## "+$window.currentTicket.id)
    TicketRequestSearch.query({ticket_id: $window.currentTicket.id}).then (TicketRequests) ->
      $scope.currentTicketRequests = TicketRequests
  
  $scope.create = (newTicketRequest) -> 
      newTicketRequest.ticket_id=$window.currentTicket.id
      new TicketRequest(newTicketRequest).create().then (ticketRequest)->   
        if ticketRequest
          console.log(ticketRequest)
          $scope.message="Request sucessfull created. An confirmation email was send to the client."
          $scope.currentTicketRequests.push ticketRequest
        else
          $scope.message="Request creation failed! Please contact your system admin!"
      
      $scope.newTicketRequest=null
        
        
  $scope.delete = (currentTicketRequest) ->  
    console.log("############################## delete()")
    currentTicketRequest.delete().then (ticketRequest) ->
      if ticketRequest
        $scope.currentTicketRequests.splice $scope.currentTicketRequests.indexOf(currentTicketRequest), 1
    
])