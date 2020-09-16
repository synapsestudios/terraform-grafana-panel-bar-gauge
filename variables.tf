# Panel General Settings
variable "title" {
  type        = string
  description = "Title for panel."
  default     = "Bar Gauge"
}

variable "description" {
  type        = string
  description = "Text description for panel."
  default     = null
}

variable "grid_position" {
  type        = object({ h = number, w = number, x = number, y = number, })
  description = "Grid Position and size for panel."
  default     = { h = 10, w = 24, x = 0, y = 0, }
}

variable "id" {
  type        = number
  description = "Unique numeric ID for panel."
  default     = 0
}

variable "plugin_version" {
  type        = string
  description = "Version number of plugin to use with panel."
  default     = "6.6.2"
}

# Queries
variable "datasource" {
  type        = string
  description = "Data source for panel."
  default     = "$datasource"
}

variable "queries" {
  type        = list(any)
  description = "List of queries as map objects"
}

variable "interval" {
  type        = string
  description = "Minimum time interval for this data source."
  default     = "30s"
}

# Visualization Display
variable "calculation" {
  type        = bool
  description = "If true, panel will show calculation. When false panel will show all values."
  default     = true
}

variable "display_orientation" {
  type        = string
  description = "Display orientation, either 'horizontal' or 'vertical'"
  default     = "horizontal"
}

variable "display_mode" {
  type        = string
  description = "Display mode for panel, options are 'gradient' 'lcd', or 'basic'"
  default     = "lcd"
}

# Field
variable "unit" {
  type        = string
  description = "Unit type, examples would be 's' for seconds, 'ms', for milliseconds 'percent'"
  default     = "none"
}

variable "min" {
  type        = number
  description = "Minimum numeric value for gauge."
  default     = 0
}

variable "max" {
  type        = number
  description = "Maximum numeric value for gauge."
  default     = 100
}

variable "thresholds" {
  type        = object({ mode = string, steps = list(object({ color = string, value = number })) })
  description = "Thresholds for gauge."
  default     = { mode = "absolute", steps = [{ color = "green", value = null }, { color = "yellow", value = 50 }, { value = 80, color = "red" }] }
}
