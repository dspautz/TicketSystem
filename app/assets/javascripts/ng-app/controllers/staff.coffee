angular.module('TicketSystem').controller("StaffCtrl", [ '$scope', '$location', '$window','$modal', 'Role', 'User', ($scope, $location, $window, $modal, Role, User )->
  
  $scope.currentUser=null
  
  User.query().then (users) ->
    $scope.users = users 
    
  Role.query().then (roles) ->
    $scope.roles = roles  
    
    
  $scope.openNewDialog = ->
    $scope.newDialogInstance = $modal.open(
      templateUrl: "users/new.html"
      controller: "NewUserInstanceCtrl"
      size: 'sm'
      resolve: 
        newUser: ->
          $scope.newUser
    )
    
    $scope.newDialogInstance.result.then (newUser) ->
      result = new User(newUser).create()
      if result?
        $scope.users.push newUsers
        $scope.message="New User created."
           
        
  $scope.delete = (currentUser) ->  
    currentUser.delete().then (user) ->
      if user
        $scope.users.splice $scope.users.indexOf(currentUser), 1
      
  $scope.update = (currentUser) -> 
    currentUser.update().then (result) ->
      if result
        $scope.users[$scope.users.indexOf(currentUser)].roleId=currentUser.roleId
        Role.get(currentUser.userId).then (role) ->
          $scope.users[$scope.users.indexOf(currentUser)].role=role
        
        $scope.message="User successful updated."
        
  $scope.edit = (currentUser) ->  
    $window.currentUser=currentUser     
    $location.path('/users/'+currentUser.id)
    
])

angular.module('TicketSystem').controller("NewUserInstanceCtrl", ['$scope', '$modalInstance', '$log', 'newUser', ($scope, $modalInstance, $log, newUser) ->
 
  $scope.newUser=newUser
 
  $scope.save = (newUser) ->
    $modalInstance.close newUser

  $scope.cancel = ->
    $modalInstance.dismiss "cancel"
])