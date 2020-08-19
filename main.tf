locals {
  #########################
  # Grafana Bar Gauge Panel
  #########################
  panel = {
    datasource    = var.datasource
    type          = "bargauge"
    title         = var.title
    gridPos       = var.grid_position
    id            = var.id
    targets       = var.queries
    timeFrom      = null
    timeShift     = null
    interval      = var.interval
    pluginVersion = var.plugin_version
    options = {
      displayMode = var.display_mode
      orientation = var.display_orientation
      fieldOptions = {
        values = ! var.calculation
        calcs  = ["max"]
        defaults = {
          thresholds = var.thresholds
          mappings   = []
          min        = var.min
          max        = var.max
          unit       = var.unit
          title      = ""
        }
        overrides = []
      }
      showUnfilled = true
    }
    description = var.description
  }
}
