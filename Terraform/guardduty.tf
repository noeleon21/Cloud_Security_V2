# resource "aws_guardduty_detector" "MyDetector" {
#   enable = true
# }

# resource "aws_sns_topic" "alerts" {
#   name = "ec2-unauthorized-alerts"
# }

# resource "aws_sns_topic_subscription" "email" {
#   topic_arn = aws_sns_topic.alerts.arn
#   protocol  = "email"
#   endpoint  = "noelgens@gmail.com" # Replace with your actual email
# }

# resource "aws_cloudwatch_event_rule" "guardduty_ec2_alerts" {
#   name        = "guardduty-ec2-alerts"
#   description = "Capture unauthorized EC2 access attempts"
#   event_pattern = jsonencode({
#     source = ["aws.guardduty"],
#     detail = {
#       type = [
#         "UnauthorizedAccess:EC2/SSHBruteForce"
#       ]
#     }
#   })
# }

# resource "aws_cloudwatch_event_target" "send_to_sns" {
#   rule = aws_cloudwatch_event_rule.guardduty_ec2_alerts.name
#   arn  = aws_sns_topic.alerts.arn
# }

# # This allows CloudWatch Events to publish to the SNS topic
# resource "aws_sns_topic_policy" "allow_cloudwatch_to_publish" {
#   arn    = aws_sns_topic.alerts.arn
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Sid       = "AllowCloudWatchEventsToPublish"
#         Effect    = "Allow"
#         Principal = {
#           Service = "events.amazonaws.com"
#         }
#         Action    = "SNS:Publish"
#         Resource  = aws_sns_topic.alerts.arn
#       }
#     ]
#   })
# }
