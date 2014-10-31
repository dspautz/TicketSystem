angular.module('OnApp').controller("RequestCtrl", [ '$scope', '$location', '$window', 'Ticket', 'User', 'Request', 'ngDialog', 'TicketSearch', 'RequestSearch', ($scope, $location, $window, Ticket, User, Request, ngDialog, TicketSearch, RequestSearch)->
    
  $scope.create = (currentRequest) -> 
      
        
        
  $scope.delete = (currentTicket) ->  currentTicket.delete().then (result) ->
   
      
  $scope.update = (currentTicket) -> currentTicket.update().then (result) ->
    
        
  $scope.edit = (currentTicket) ->  
    
    
  $scope.search = (searchObj) ->
    
])