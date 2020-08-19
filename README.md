# Grafana Panel Bar Gauge
This Terraform module provides a basic template for creating Bar Gauge panels for use within a Grafana dash-board.  


Example Usage:
```terraform
#####################################
# AWS ALB - Response Time Gauge/Meter
#####################################
module "grafana_alb_response_time_bargauge" {
  source        = "../grafana-panel-bargauge/"
  title         = "Response Time"
  id            = 0
  min           = 0
  max           = 1.5
  unit          = "s"
  grid_position = { h = 5, w = 12, x = 0, y = 0 }
  description   = "Overall Response Times"
  queries = [{
    refId      = "A"
    region     = local.region
    namespace  = "AWS/ApplicationELB"
    dimensions = { LoadBalancer = local.loadbalancer_name }
    metricName = "TargetResponseTime"
    alias      = "Average Response Time"
    statistics = ["Average"]
    period     = "$__interval"
    },
    {
      refId      = "B",
      region     = local.region,
      namespace  = "AWS/ApplicationELB",
      dimensions = { LoadBalancer = local.loadbalancer_name }
      metricName = "TargetResponseTime",
      alias      = "Max Response Time"
      statistics = ["Maximum"]
      period     = "$__interval"
  }]
  thresholds = {
    mode = "absolute"
    steps = [
      { color = "green", value = null },
      { color = "yellow", value = 0.5 },
      { value = 1, color = "red" }
    ]
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.6 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| queries | List of queries as map objects | `list(any)` | n/a | yes |
| calculation | If true, panel will show calculation. When false panel will show all values. | `bool` | `true` | no |
| datasource | Data source for panel. | `string` | `"$datasource"` | no |
| description | Text description for panel. | `string` | `null` | no |
| display\_mode | Display mode for panel, options are 'gradient' 'lcd', or 'basic' | `string` | `"lcd"` | no |
| display\_orientation | Display orientation, either 'horizontal' or 'vertical' | `string` | `"horizontal"` | no |
| grid\_position | Grid Position and size for panel. | `object({ h = number, w = number, x = number, y = number, })` | <pre>{<br>  "h": 10,<br>  "w": 24,<br>  "x": 0,<br>  "y": 0<br>}</pre> | no |
| id | Unique numeric ID for panel. | `number` | `0` | no |
| interval | Minimum time interval for this data source. | `string` | `"30s"` | no |
| max | Maximum numeric value for gauge. | `number` | `100` | no |
| min | Minimum numeric value for gauge. | `number` | `0` | no |
| plugin\_version | Version number of plugin to use with panel. | `string` | `"6.6.2"` | no |
| thresholds | Thresholds for gauge. | `object({ mode = string, steps = list(object({ color = string, value = number })) })` | <pre>{<br>  "mode": "absolute",<br>  "steps": [<br>    {<br>      "color": "green",<br>      "value": null<br>    },<br>    {<br>      "color": "yellow",<br>      "value": 50<br>    },<br>    {<br>      "color": "red",<br>      "value": 80<br>    }<br>  ]<br>}</pre> | no |
| title | Title for panel. | `string` | `"Bar Gauge"` | no |
| unit | Unit type, examples would be 's' for seconds, 'ms', for milliseconds 'percent' | `string` | `"none"` | no |

## Outputs

| Name | Description |
|------|-------------|
| panel | Map containing panel. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->