angular.module('TicketSystem').controller("TicketStatusCtrl", [ '$scope', '$location', '$window', 'TicketStatus', '$modal', ($scope, $location, $window, TicketStatus, $modal)->
 
    TicketStatus.query().then (ticketStatuses) ->
      $scope.ticketStatuses = ticketStatuses
      
    $scope.currentTicketStatus=null
    
    
    $scope.openNewDialog = ->
      $scope.newDialogInstance = $modal.open(
        templateUrl: "ticket_statuses/new.html"
        controller: "NewTicketStatusInstanceCtrl"
        size: 'sm'
        resolve: 
          newTicketStatus: ->
            $scope.newTicketStatus
      )
    
      $scope.newDialogInstance.result.then (newTicketStatus) ->
     #   $scope.newTicketStatus = newTicketStatus
        result = new TicketStatus(newTicketStatus).create()
        if result?
          $scope.ticketStatuses.push newTicketStatus
          $scope.message="New Ticket-Status created."
    
])

angular.module('TicketSystem').controller("NewTicketStatusInstanceCtrl", ['$scope', '$modalInstance', '$log', 'newTicketStatus', ($scope, $modalInstance, $log, newTicketStatus) ->
 
  $scope.newTicketStatus=newTicketStatus;
 
  $scope.save = (newTicketStatus) ->
    $modalInstance.close newTicketStatus

  $scope.cancel = ->
    $modalInstance.dismiss "cancel"
])