angular.module('TicketSystem').controller("TicketCtrl", [ '$scope', '$location', '$window', 'Ticket', 'TicketStatus', 'User',  ($scope, $location, $window, Ticket, TicketStatus, User)->
 
  $scope.message=""
  $scope.currentTicket=$window.currentTicket
  
  if $scope.currentTicket
    $scope.currentTicket.getUser().then (user) ->
      if user
        $scope.currentTicketOwner = user
    $scope.currentTicket.getStatus().then (ticketStatus) ->
      if ticketStatus
        $scope.currentTicketStatus = ticketStatus    
      
  $scope.tickets=[]
  $scope.users=[]
  $scope.searchObj=null
  $scope.searchTypes=["Search by subject", "Search by keywords", "Search by reference no."]
  #$scope.statuses=[ "Waiting for Staff Response", "Waiting for Customer", "On Hold", "Cancelled", "Complete" ]
  TicketStatus.query().then (ticketStatuses) ->
      $scope.ticketStatuses = ticketStatuses
  $scope.showSearchResult=false
  $scope.searchResult=[]
  
  Ticket.query().then (tickets) -> 
    angular.forEach(tickets,(ticket)->
      ticket.getStatus().then (ticketStatus) ->
        ticket.ticketStatus = ticketStatus        
      ticket.getUser().then (user) ->
        ticket.user = user   
    )
    $scope.tickets = tickets
     
  User.query().then (users) ->
    $scope.users = users    
    
    
  $scope.create = (currentTicket) -> 
      result = new Ticket(currentTicket).create()
      if result?
        $scope.message="Ticket created successfull. An confirmation email was send to your email address."
        $scope.currentTicket=null
      else
        $scope.message="Ticket creation failed! Try again."
        $scope.currentTicket=null
        
        
  $scope.delete = (currentTicket) ->  
    currentTicket.delete().then (ticket) ->
      if ticket
        $scope.tickets.splice $scope.tickets.indexOf(currentTicket), 1
      
  $scope.update = (currentTicket) -> 
    currentTicket.update().then (result) ->
      if result
        $scope.tickets[$scope.tickets.indexOf(currentTicket)].ticketStatusId=currentTicket.ticketStatusId
        TicketStatus.get(currentTicket.ticketStatusId).then (ticketStatus) ->
          $scope.tickets[$scope.tickets.indexOf(currentTicket)].ticketStatus=ticketStatus
        
        $scope.tickets[$scope.tickets.indexOf(currentTicket)].userId=currentTicket.userId
        User.get(currentTicket.userId).then (user) ->
          $scope.tickets[$scope.tickets.indexOf(currentTicket)].user=user
        
        $scope.message="Ticket successful updated"
        console.log("Ticket successful updated")
        
  $scope.edit = (currentTicket) ->  
    $window.currentTicket=currentTicket     
    $location.path('/tickets/'+currentTicket.id)
    
  $scope.search = (searchObj) ->
    searchType = searchObj.searchType
    searchKey = searchObj.key
    $scope.searchResult=[]
      
      
 # Filter
 
  $scope.isNew = (ticket) ->
    if ticket.ticketStatus && ticket.ticketStatus.text ==  "Waiting for Staff Response"
      return true
    return false
      
  $scope.isWaiting = (ticket) ->
    if ticket.ticketStatus && ticket.ticketStatus.text ==  "Waiting for Customer"
      return true
    return false
      
   $scope.isOnHold = (ticket) ->
     if ticket.ticketStatus && ticket.ticketStatus.text ==  "On Hold"
       return true 
     return false
      
   $scope.isClosed = (ticket) ->
     if ticket.ticketStatus && (ticket.ticketStatus.text=="Cancelled" || ticket.ticketStatus.text=="Complete")
       return true
     return false
])

