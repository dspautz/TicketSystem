angular.module('OnApp').controller("TicketCtrl", [ '$scope', '$location', '$window', 'Ticket', 'User', 'TicketSearch', ($scope, $location, $window, Ticket, User, TicketSearch)->
 
  $scope.message=""
  $scope.currentTicket=$window.currentTicket
  
  if $scope.currentTicket
    $scope.currentTicket.getUser().then (user) ->
      $scope.currentTicketOwner = user    
      
  $scope.tickets=[]
  $scope.users=[]
  $scope.searchObj=null
  $scope.searchTypes=["Search by subject", "Search by keywords", "Search by reference no."]
  $scope.statuses=[ "Waiting for Staff Response", "Waiting for Customer", "On Hold", "Cancelled", "Complete" ]
  $scope.showSearchResult=false
  $scope.searchResult=[]
  
  
  console.log($window.currentTicket)
  console.log($scope.currentTicket)
  
  Ticket.query().then (tickets) ->
    $scope.tickets = tickets
    angular.forEach(tickets, (ticket) ->
       console.log("########################### "+ticket.status)
    )
        
  User.query().then (users) ->
    $scope.users = users    
    
    
  $scope.create = (currentTicket) -> 
      result = new Ticket(currentTicket).create()
      console.log(result)
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
      
  $scope.update = (currentTicket) -> currentTicket.update().then (result) ->
    if result
      $scope.message="Ticket successful updated"
      console.log("Ticket successful updated")
        
  $scope.edit = (currentTicket) ->  
    $window.currentTicket=currentTicket     
    $location.path('/tickets/'+currentTicket.id)
    
  $scope.search = (searchObj) ->
    searchType = searchObj.searchType
    searchKey = searchObj.key
    $scope.searchResult=[]
    TicketSearch.query({searchType: searchType, searchKey: searchKey}).then (tickets) ->   
      $scope.searchResult = tickets
      $scope.showSearchResult=true 
      
      
 # Filter
 
   $scope.isNew = (ticket) ->
      if ticket.status=="Waiting for Staff Response"
        return true
      return false
      
   $scope.isWaiting = (ticket) ->
      if ticket.status=="Waiting for Customer"
        return true
      return false
      
   $scope.isOnHold = (ticket) ->
      if ticket.status=="On Hold"
        return true
      return false
      
   $scope.isClosed = (ticket) ->
      if ticket.status=="Cancelled" || ticket.status=="Complete"
        return true
      return false
])

angular.module('OnApp').controller('TabsCtrl', ($scope) ->
  $scope.tabs = [
    { title:'Dynamic Title 1', content:'Dynamic content 1' },
    { title:'Dynamic Title 2', content:'Dynamic content 2', disabled: true }
])