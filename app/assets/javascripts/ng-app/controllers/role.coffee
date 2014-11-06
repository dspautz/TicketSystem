angular.module('TicketSystem').controller("RoleCtrl", [ '$scope', '$location', '$window', '$modal', '$log', 'Role', ($scope, $location, $window, $modal, $log, Role) ->
        
  $scope.currentRole=null
   
  Role.query().then (roles) ->
    $scope.roles = roles            
            
    
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
      console.log newRole
      result = new Role(newRole).create()
      console.log result
      if result?
        $scope.roles.push newRole
        $scope.message="New Role created."
        
  $scope.delete = (currentRole) ->  
    currentRole.delete().then (role) ->
      if role
        $scope.roles.splice $scope.roles.indexOf(currentRole), 1
      
  $scope.update = (currentRole) -> 
    currentUser.update().then (result) ->
      if result
        $scope.roles[$scope.roles.indexOf(currentRole)]=currentRole
        $scope.message="Role successful updated."
        
  $scope.edit = (currentRole) ->  
    $window.currentRole=currentRole     
    $location.path('/roles/'+currentRole.id)
])

angular.module('TicketSystem').controller("NewRoleInstanceCtrl", ['$scope', '$modalInstance', '$log', 'newRole', ($scope, $modalInstance, $log, newRole) ->
 
  console.log newRole
  $scope.newRole=newRole;
 
  $scope.save = (newRole) ->
    console.log newRole
    $modalInstance.close newRole

  $scope.cancel = ->
    $modalInstance.dismiss "cancel"
])