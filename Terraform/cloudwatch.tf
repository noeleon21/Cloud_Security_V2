# resource "aws_cloudwatch_metric_alarm" "ec2-instance" {
#   alarm_name                = "ec2-usage"
#   comparison_operator       = "GreaterThanOrEqualToThreshold"
#   evaluation_periods        = 2
#   metric_name               = "CPUUtilization"
#   namespace                 = "AWS/EC2"
#   period                    = 120
#   statistic                 = "Average"
#   threshold                 = 80
#   alarm_description         = "This metric monitors ec2 cpu utilization"
#   insufficient_data_actions = []
#   dimensions = {
#     InstanceId = aws_instance.web.id
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "rds-instance" {
#   alarm_name                = "ec2-usage"
#   comparison_operator       = "GreaterThanOrEqualToThreshold"
#   evaluation_periods        = 2
#   metric_name               = "DatabaseConnections"
#   namespace                 = "AWS/EC2"
#   period                    = 120
#   statistic                 = "Average"
#   threshold                 = 80
#   alarm_description         = "This metric monitors ec2 cpu utilization"
#   insufficient_data_actions = []
#   dimensions = {
#     InstanceId = aws_db_instance.myrds.id
#   }
# }