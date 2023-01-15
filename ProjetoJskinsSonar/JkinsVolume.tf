resource "aws_volume_attachment" "ebs_att" {
  device_name = "Jenkisvolume"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.jks.id
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1"
  size              = 50
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.example.id

  tags = {
    Name = "HelloWorld_snap"
  }
}