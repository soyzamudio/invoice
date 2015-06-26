angular.module 'app.services', []
angular.module 'app.directives', []
angular.module 'app.filters', []
angular.module 'app.components', []
angular.module 'app.pages', []
angular.module 'app', [
  # Angular modules
  'ui.router'
  'ngMessages'

  # Our container modules
  'app.services'
  'app.directives'
  'app.filters'
  'app.components'
  'app.pages'
]
