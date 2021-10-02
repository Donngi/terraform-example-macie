resource "aws_macie2_account" "main" {
  finding_publishing_frequency = "FIFTEEN_MINUTES"
  status                       = "ENABLED"
}

resource "aws_macie2_classification_job" "sample" {
  name     = "sample-classification-job"
  job_type = "SCHEDULED"

  schedule_frequency {
    daily_schedule = "true"
  }
  initial_run = true

  s3_job_definition {
    bucket_definitions {
      account_id = data.aws_caller_identity.current.account_id
      buckets    = [var.target_s3_bucket_name]
    }
  }
  sampling_percentage = 100

  depends_on = [aws_macie2_account.main]
}
