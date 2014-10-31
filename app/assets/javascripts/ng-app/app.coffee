@onApp = angular.module('OnApp', [
  'templates',
  'ngRoute',
  'rails',
  'ngDialog',
  'confirmClick',
  "ui.bootstrap"
])

# for compatibility with Rails CSRF protection
@onApp.config([
  '$httpProvider', ($httpProvider)->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])



@onApp.config([ '$locationProvider', 
  ($locationProvider)->
    $locationProvider.html5Mode(enabled: true);
    
])

@onApp.config([ '$routeProvider', 
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

@onApp.config(['ngDialogProvider', (ngDialogProvider) ->
    ngDialogProvider.setDefaults(
        className: 'ngdialog-theme-default',
        showClose: true,
        closeByDocument: true,
        closeByEscape: true
    )
])

@onApp.run( ->
  console.log 'angular app running'  
)



 


