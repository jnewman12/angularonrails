App.controller 'ScreencastsCtrl', ['$scope', 'Screencast', ($scope, Screencast) ->
  #  accessible on the view
  $scope.selectedScreencast = null
  $scope.selectedRow        = null

  # gather the screencasts and set the selected one to the first 
  $scope.screencasts = Screencast.query ->
    $scope.selectedScreencast = $scope.screencasts[0]
    $scope.selectedRow = 0

  # Set the selected screencast to the one which was clicked
  $scope.showScreencast = (screencast, row) ->
    $scope.selectedScreencast = screencast
    $scope.selectedRow = row
]