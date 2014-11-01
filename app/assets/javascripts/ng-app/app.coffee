@ticketSystem = angular.module('TicketSystem', [
  'templates',
  'ngRoute',
  'rails',
  'confirmClick',
  "ui.bootstrap"
])

# for compatibility with Rails CSRF protection
@ticketSystem.config([
  '$httpProvider', ($httpProvider)->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])



@ticketSystem.config([ '$locationProvider', 
  ($locationProvider)->
    $locationProvider.html5Mode(enabled: true);
    
])

@ticketSystem.config([ '$routeProvider', 
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "home/index.html",
        controller: 'HomeCtrl'
      )
      .when('/tickets',
        templateUrl: "tickets/index.html",
        controller: 'TicketCtrl'
      )
      .when('/tickets/:id',
        templateUrl: "tickets/ticket.html",
        controller: 'TicketCtrl'
      )
      
     # .otherwise(
     #   redirectTo: '/'
     # )
      
])

@ticketSystem.run( ->
  console.log 'angular app running'  
)



 


