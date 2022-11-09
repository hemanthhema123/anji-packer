locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "Linux" {
  ami_name      = "packer${local.timestamp}"
  instance_type = "t2.micro"
  region        = "ap-northeast-1"
  source_ami    = "ami-0de5311b2a443fb89"
  ssh_username  = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.Linux"]
}