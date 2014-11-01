angular.module('TicketSystem').controller("LoginCtrl", [ '$scope', '$location', 'Login', ($scope, $location, Login)->
 
        
    
  $scope.formUser=null
    
  $scope.login = (formUser) -> Login.query(formUser).then (user) ->
         
      if user?
        $location.path('/tickets')
      else
        $scope.formUser=null        
        $scope.message="Wrong username or password!"
      
])