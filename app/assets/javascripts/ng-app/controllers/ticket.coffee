angular.module('OnApp').controller("TicketCtrl", [ '$scope', '$location', '$window', 'Ticket', 'User', 'Request', 'StatusList', 'ngDialog', 'TicketSearch', 'RequestSearch', 'UserSearch', ($scope, $location, $window, Ticket, User, Request, StatusList, ngDialog, TicketSearch, RequestSearch, UserSearch)->
 
  $scope.message=""
  $scope.current_ticket=$window.current_ticket
  
  if $scope.current_ticket
    RequestSearch.query({ticket_id: $scope.current_ticket.id}).then (requests) ->
      $scope.currentTicketRequests = requests
      
    if $scope.current_ticket.userId
      UserSearch.query({user_id: $scope.current_ticket.userId}).then (user) ->
        $scope.currentTicketOwner = user
      
   
        
  $scope.tickets=[]
  $scope.users=[]
  $scope.statuses=[]
  $scope.action=$window.ticket_action
  $scope.searchObj=null
  $scope.searchTypes=["Search by subject", "Search by keywords", "Search by reference no."]
  $scope.showSearchResult=false
  $scope.searchResult=[]
  
  
  console.log($window.current_ticket)
  console.log($scope.current_ticket)
  
  Ticket.query().then (tickets) ->
    $scope.tickets = tickets 
    
  User.query().then (users) ->
    $scope.users = users    
    
  StatusList.query().then (statuses) ->
    $scope.statuses = statuses    
    
   
  $scope.create = (current_ticket) -> 
      result = new Ticket(current_ticket).create()
      console.log(result)
      if result?
        $scope.message="Ticket created successfull. An confirmation email was send to your email address."
        $scope.current_ticket=null
      else
        console.log("Error during ticket creation!")
        $scope.message="Ticket creation failed! Try again."
        $scope.current_ticket=null
        
        
  $scope.delete = (current_ticket) ->  current_ticket.delete().then (result) ->
    if result
      $scope.tickets.splice $scope.tickets.indexOf(current_ticket), 1
      ngDialog.open({ 
        template: 'dialogs/error.html',
        scope: $scope,
        className: 'ngdialog-theme-default',
        
      })
      
  $scope.update = (current_ticket) -> current_ticket.update().then (result) ->
    if result
      $scope.message="Ticket successful updated"
      console.log("Ticket successful updated")
        
  $scope.edit = (current_ticket) ->  
    console.log("####################################################     "+current_ticket.id)
    console.log(current_ticket)
    $window.current_ticket=current_ticket 
      
    $location.path('/tickets/'+current_ticket.id)
    
  $scope.search = (searchObj) ->
    searchType = searchObj.searchType
    searchKey = searchObj.key
    $scope.searchResult=[]
    TicketSearch.query({searchType: searchType, searchKey: searchKey}).then (tickets) ->
      
      $scope.searchResult = tickets
      console.log('hello world')
      console.log($scope.searchResult)
      $scope.showSearchResult=true 
    
])

angular.module('OnApp').controller('TicketTabsCtrl', ($scope) ->
  $scope.tabs = [
    { title:'Dynamic Title 1', content:'Dynamic content 1' },
    { title:'Dynamic Title 2', content:'Dynamic content 2', disabled: true }
  ]

  $scope.alertMe = ->
    setTimeout(->
      alert('You\'ve selected the alert tab!')
    )  
)