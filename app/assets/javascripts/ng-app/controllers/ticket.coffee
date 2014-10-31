angular.module('OnApp').controller("TicketCtrl", [ '$scope', '$location', '$window', 'Ticket', 'User', 'Request', 'ngDialog', 'TicketSearch', 'RequestSearch', ($scope, $location, $window, Ticket, User, Request, ngDialog, TicketSearch, RequestSearch)->
 
  $scope.message=""
  $scope.currentTicket=$window.currentTicket
  
  if $scope.currentTicket
    RequestSearch.query({ticket_id: $scope.currentTicket.id}).then (requests) ->
      $scope.currentTicketRequests = requests
      
    $scope.currentTicket.getUser().then (user) ->
      $scope.currentTicketOwner = user    
      
  $scope.tickets=[]
  $scope.users=[]
  $scope.action=$window.ticket_action
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
        
        
  $scope.delete = (currentTicket) ->  currentTicket.delete().then (result) ->
    if result
      $scope.tickets.splice $scope.tickets.indexOf(currentTicket), 1
      ngDialog.open({ 
        template: 'dialogs/error.html',
        scope: $scope,
        className: 'ngdialog-theme-default',
        
      })
      
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
])

angular.module('OnApp').controller('TicketTabsCtrl', ($scope) ->
  $scope.tabs = [
    { title:'Dynamic Title 1', content:'Dynamic content 1' },
    { title:'Dynamic Title 2', content:'Dynamic content 2', disabled: true }
])