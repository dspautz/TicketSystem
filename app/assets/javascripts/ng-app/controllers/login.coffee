angular.module('TicketSystem').controller("LoginCtrl", [ '$scope', '$location', 'Login', ($scope, $location, Login)->
 
        
    
  $scope.formUser=null
    
  $scope.login = (formUser) -> Login.query(formUser).then (user) ->
         
      if user?
        $location.path('/management')
      else
        $scope.formUser=null        
        $scope.message="Wrong username or password!"
      
])