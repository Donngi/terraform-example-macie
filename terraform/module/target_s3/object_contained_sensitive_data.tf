resource "aws_s3_bucket_object" "sensitive" {
  content = "expiration 05/25\n"
  bucket  = aws_s3_bucket.target.id
  key     = "sensitive.txt"
}
