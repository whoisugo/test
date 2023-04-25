resource "aws_dynamodb_table" "move-money" {
 
  name                        = var.name
  billing_mode                = var.billing_mode
  hash_key                    = var.hash_key
  read_capacity               = var.read_capacity
  write_capacity              = var.write_capacity
  table_class                 = var.table_class



  attribute {
    name = "CmRequestId"
    type = "S"
  }

 
  ttl {
    enabled = true
    attribute_name = "expiredPeriod"
  }

  point_in_time_recovery {
    enabled = var.point_in_time_recovery_enabled
  }

  server_side_encryption {
    enabled     = var.server_side_encryption_enabled
    kms_key_arn = var.server_side_encryption_kms_key_arn
  }

  lifecycle {
    ignore_changes = [
      "write_capacity",
      "read_capacity"
    ]
  }

}