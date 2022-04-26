data "aws_vpc" "vpc" {
  default = true
}

# Mac インスタンス一覧
# aws ec2 describe-images --region ap-northeast-1 --filters 'Name=name,Values=amzn-ec2-macos-*' --output json | jq '.Images[] | [.Name,.Description]' -cC | sort
data "aws_ami" "mac" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = [
      "amzn-ec2-macos-12.3.1-*-*" # Monterey
    ]
  }
  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}
