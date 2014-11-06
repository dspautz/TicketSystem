angular.module('TicketSystem').controller("RoleCtrl", [ '$scope', '$location', '$window', '$modal', '$log', 'Role', ($scope, $location, $window, $modal, $log, Role) ->
         
  Role.query().then (roles) ->
    console.log roles
    $scope.roles = roles            
            
    $scope.newRole=null
    $scope.newDialogInstance=null
    
    $scope.openNewDialog = ->
      $scope.newDialogInstance = $modal.open(
        templateUrl: "roles/new.html"
        controller: "NewRoleInstanceCtrl"
        size: 'sm'
        resolve: 
          newRole: ->
            $scope.newRole
      )
    
      $scope.newDialogInstance.result.then (newRole) ->
        $scope.newRole = newRole
        $log.info("###########################"+newRole)
])

angular.module('TicketSystem').controller "NewRoleInstanceCtrl", ($scope, $modalInstance, $log, newRole) ->
 
  $scope.newRole=null;
 
  $scope.save = (newRole) ->
    $log.info("###########################"+newRole)
    $modalInstance.close newRole

  $scope.cancel = ->
    $modalInstance.dismiss "cancel"
