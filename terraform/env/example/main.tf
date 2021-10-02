module "macie" {
  source                = "../../module/macie"
  target_s3_bucket_name = module.target_s3.target_s3_bucket_name
}

module "target_s3" {
  source = "../../module/target_s3"
}
