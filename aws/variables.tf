# --------------------------------------------
# Variables to update
# --------------------------------------------
# https://aws.amazon.com/ec2/instance-types/
variable "aws" {
  type = map(string)

  default = {
    "region"           = "us-east-1"
    "instance_type"    = "t3.large"
    "private_key"      = "aws-east"
    "private_key_path" = "~/.ssh/aws-east.pem"
    "ip_allowlist"     = "0.0.0.0/0"
  }
}

variable "zpot" {
  type = map(string)

  default = {
    "timezone" = "UTC"
    "tpot_flavor" = "SENSOR"
    "linux_password" = "randomstringbecausethisisnotused209fdejxkldurw"
    "web_user" = "not_used"
    "web_password" = "randomstringbecausethisisnotused209fdejxkldurw"
  }
}

# --------------------------------------------
# Don't update the below varaibles
#   Unless you know what you are doing :)
# --------------------------------------------

# https://wiki.debian.org/Cloud/AmazonEC2Image/Bullseye
variable "debian_ami" {
  type = map(string)
  default = {
    "af-south-1"     = "ami-079fa721a5ed1fddc"
    "ap-east-1"      = "ami-06214aeeff0d25699"
    "ap-northeast-1" = "ami-09d1e56efb8d95692"
    "ap-northeast-2" = "ami-0cdef9c0005fd404e"
    "ap-northeast-3" = "ami-0845fc746871fe9b5"
    "ap-south-1"     = "ami-0e6839fbd15596401"
    "ap-south-2"     = "ami-01878b164ca30ca21"
    "ap-southeast-1" = "ami-02c87b06d719a84f5"
    "ap-southeast-2" = "ami-002823c00a4bf6137"
    "ap-southeast-3" = "ami-010ef7dc3b46d8e8d"
    "ap-southeast-4" = "ami-0ef73778ad55d2031"
    "ca-central-1"   = "ami-021066a1e4688eccb"
    "ca-west-1"      = "ami-0a3730c9262db2b4d"
    "eu-central-1"   = "ami-0bcdaec79540ad7a6"
    "eu-central-2"   = "ami-00e0531e8700f595e"
    "eu-north-1"     = "ami-0e988f0584888c46b"
    "eu-south-1"     = "ami-000e19c408699eddd"
    "eu-south-2"     = "ami-0b19004db179bc9f3"
    "eu-west-1"      = "ami-073c25713c876fafa"
    "eu-west-2"      = "ami-09c530d398830f5d9"
    "eu-west-3"      = "ami-08fbb6bbadadb326e"
    "il-central-1"   = "ami-0c07400e54d164651"
    "me-central-1"   = "ami-0ebb12627a673cd80"
    "me-south-1"     = "ami-01c909a9da532fb1a"
    "sa-east-1"      = "ami-08b1d87dfe6cd62c8"
    "us-east-1"      = "ami-0fd320e6b2de9e34a"
    "us-east-2"      = "ami-06c0fec879a55428f"
    "us-west-1"      = "ami-069d646f9e35f6ac1"
    "us-west-2"      = "ami-0fa24cec994ef5858"
  }
}

# https://wiki.debian.org/Cloud/AmazonEC2Image/Bookworm
variable "debian_bookworm" {
  type = map(string)

  default = {
    "af-south-1"     = "ami-0c340a880c01f45dc"
    "ap-east-1"      = "ami-03e011b20cc3eb9ad"
    "ap-northeast-1" = "ami-08c58abb4bd7fdf48"
    "ap-northeast-2" = "ami-0782173ac8dd43ead"
    "ap-northeast-3" = "ami-04088c641c86a8cd3"
    "ap-south-1"     = "ami-0f7749c2155b4aa41"
    "ap-south-2"     = "ami-03dace10096b085c0"
    "ap-southeast-1" = "ami-06e25c4a45918a7ad"
    "ap-southeast-2" = "ami-0e1dab4992930dfc5"
    "ap-southeast-3" = "ami-06a331418b1986707"
    "ap-southeast-4" = "ami-01920df6764a616d2"
    "ca-central-1"   = "ami-064d502aeb1744e24"
    "ca-west-1"      = "ami-0d7891a6c504ca3ba"
    "eu-central-1"   = "ami-0e626c31414223120"
    "eu-central-2"   = "ami-0388736a84da3da43"
    "eu-north-1"     = "ami-0735de43bc09fe101"
    "eu-south-1"     = "ami-0db6556eb549643d9"
    "eu-south-2"     = "ami-05ba2fddf42cb711a"
    "eu-west-1"      = "ami-04db4ad9b30430256"
    "eu-west-2"      = "ami-04ff18fe839e02019"
    "eu-west-3"      = "ami-07254a4b88b1dc88d"
    "il-central-1"   = "ami-0285c3a2937c2f32b"
    "me-central-1"   = "ami-07f9bd8efb6fef0c1"
    "me-south-1"     = "ami-033a15bfac8dd3f7b"
    "sa-east-1"      = "ami-08daa9eaf8b0ea93e"
    "us-east-1"      = "ami-02269465a4b1f7ef5"
    "us-east-2"      = "ami-006309fcfbf4b30d6"
    "us-west-1"      = "ami-0d1e92cd5c4f492eb"
    "us-west-2"      = "ami-0eabbc35930d487e3"
  }
}